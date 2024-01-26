package com.example.searchregistry.service.impl.ibr;


import com.example.searchregistry.pojo.ibr.Person;
import com.example.searchregistry.pojo.ibr.PersonRecord;
import com.example.searchregistry.pojo.request.QueryExpression;
import com.example.searchregistry.pojo.request.SearchRequest;
import com.example.searchregistry.pojo.response.*;
import com.example.searchregistry.repository.PersonRecordRepository;
import com.example.searchregistry.repository.PersonRepository;
import com.example.searchregistry.service.ISearchService;
import com.example.searchregistry.utils.CustomQueryMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.springframework.data.jpa.domain.Specification.where;


@Service("IbrRecordImpl")
@Slf4j
public class SearchIbrPersonRecordImpl implements ISearchService {

    @Autowired
    CustomQueryMapper customQueryMapper;

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    private PersonRecordRepository personRecordRepo;

    @Autowired
    private PersonRepository repository;

    @Autowired
    private IbrJpaSpecificationImpl specificationImpl;

    private SearchResponse getSearchResponse(List<Person> personRecord, SearchRequest searchRequest) {
        SearchResponse response = new SearchResponse();

        response.setSignature(searchRequest.getSignature());
        Header header = new Header();
        response.setHeader(header);
        ResponseData data = new ResponseData();
        data.setVersion("1.0.0");
        data.setRegRecords(personRecord);

        SearchResponseObj searchResponse = new SearchResponseObj();
        searchResponse.setReferenceId("12345678901234567890");
        searchResponse.setStatus("rcvd");
        searchResponse.setStatusReasonCode("rjct.reference_id.invalid");
        searchResponse.setStatusReasonMessage("string");
        searchResponse.setData(data);

        Message message = new Message();
        message.setTransactionId("123456789");
        message.setCorrelationId("9876543210");
        message.setSearchResponse(List.of(searchResponse));

        response.setMessage(message);
        return response;
    }

    @Override
    public SearchResponse searchPersonData(SearchRequest searchRequest) {
        log.info("Searching Started");

        Object queryObject = searchRequest.getMessage().getSearchRequest().get(0).getSearchCriteria().getQuery();

        log.info("Queries:===== " + queryObject);

        if (queryObject instanceof Map) {
            Map<String, Object> query = (Map<String, Object>) queryObject;

            if (query.containsKey("type") && query.containsKey("value")) {
                String type = query.get("type").toString();
                String value = query.get("value").toString();

                List<Integer> personIds = findIdsByTypeAndValue(type, value);

                log.info("Ids-----" + personIds);

                List<Person> personDataList = repository.findAllById(personIds);

                final SearchResponse response = getSearchResponse(personDataList, searchRequest);

                log.info("Response========= " + response);

                return response;

            }
        } else if (queryObject instanceof List) {
            List<Map<String, Object>> expressionQueries = (List<Map<String, Object>>) queryObject;
            List<QueryExpression> queryExpressions = new ArrayList<>();

            Specification<PersonRecord> specificationFromFilters = null;

            for (Map<String, Object> expressionQuery : expressionQueries) {
                if (expressionQuery.containsKey("expression1") && expressionQuery.containsKey("seq_num")) {

                    QueryExpression queryExpression = customQueryMapper.mapToQueryExpression(expressionQuery);
                    queryExpressions.add(queryExpression);
                }
            }

            specificationFromFilters = getSpecificationFromFilters(queryExpressions, specificationFromFilters);

            return getSearchResponseBySpecification(searchRequest, specificationFromFilters);

        }
        return null;
    }

    private SearchResponse getSearchResponseBySpecification(SearchRequest searchRequest, Specification<PersonRecord> specificationFromFilters) {
        List<PersonRecord> personRecord;
        if (specificationFromFilters == null) {

            personRecord = personRecordRepo.findAll();

            return getResponse(searchRequest, personRecord);

        } else {
            personRecord = personRecordRepo.findAll(specificationFromFilters);

            return getResponse(searchRequest, personRecord);
        }
    }

    private SearchResponse getResponse(SearchRequest searchRequest, List<PersonRecord> personRecord) {
        List<Integer> ids = personRecord.stream()
                .map(PersonRecord::getId)
                .collect(Collectors.toList());
        List<Person> personDataList = repository.findAllById(ids);

        return getSearchResponse(personDataList, searchRequest);
    }

    private Specification<PersonRecord> getSpecificationFromFilters(List<QueryExpression> filter, Specification<PersonRecord> specificationFromFilters) {
        List<QueryExpression> filterData = new ArrayList<>(filter);

        Specification<PersonRecord> specification = specificationFromFilters
                == null
                ? where(specificationImpl.createSpecificationForQueryExp(filterData.get(0).getExpression1())
                .and(specificationImpl.createSpecificationForQueryExp(filterData.get(0).getExpression2())))
                : specificationFromFilters;

        for (QueryExpression input : filterData) {

            Specification<PersonRecord> exp1Spec = specificationImpl.createSpecificationForQueryExp(input.getExpression1());

            if (input.getCondition() != null) {
                Specification<PersonRecord> exp2Spec = specificationImpl.createSpecificationForQueryExp(input.getExpression2());

                switch (input.getCondition()) {
                    case "and":
                        specification = specification.and(exp1Spec.and(exp2Spec));
                        break;
                    case "or":
                        specification = specification.or(exp1Spec.or(exp2Spec));
                        break;
                    case "not":
                        specification = specification.or(exp1Spec).and(Specification.not(exp2Spec));
                        break;
                    default:
                        throw new RuntimeException("Condition not supported!!!");
                }
            } else {
                specification = specification.and(exp1Spec);
            }
        }
        return specification;
    }

    public List<Integer> findIdsByTypeAndValue(String type, String value) {
        Specification<PersonRecord> specification = specificationImpl.createSpecificationForQueryType(type, value);


        List<PersonRecord> records = personRecordRepo.findAll(specification);

        List<Integer> ids = records.stream()
                .map(PersonRecord::getId)
                .collect(Collectors.toList());

        return ids;
    }

}
