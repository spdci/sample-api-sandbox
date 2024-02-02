package org.spdci.searchregistry.service.impl.social;

import static org.springframework.data.jpa.domain.Specification.where;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.spdci.searchregistry.pojo.request.Query;
import org.spdci.searchregistry.pojo.request.QueryExpression;
import org.spdci.searchregistry.pojo.request.SearchRequest;
import org.spdci.searchregistry.pojo.response.Header;
import org.spdci.searchregistry.pojo.response.Message;
import org.spdci.searchregistry.pojo.response.ResponseData;
import org.spdci.searchregistry.pojo.response.SearchResponse;
import org.spdci.searchregistry.pojo.response.SearchResponseObj;
import org.spdci.searchregistry.pojo.social.SocialPerson;
import org.spdci.searchregistry.pojo.social.SocialPersonRecord;
import org.spdci.searchregistry.repository.SocialPersonRecordRepository;
import org.spdci.searchregistry.repository.SocialPersonRepository;
import org.spdci.searchregistry.service.ISearchService;
import org.spdci.searchregistry.utils.CustomQueryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Service("SocialRecordImpl")
@Slf4j
public class SearchSocialPersonRecordImpl implements ISearchService {

	@Autowired
	CustomQueryMapper customQueryMapper;

	@Autowired
	ObjectMapper objectMapper;

	@Autowired
	private SocialPersonRecordRepository socialPersonRecordRepository;

	@Autowired
	private SocialPersonRepository socialPersonRepository;

	@Autowired
	private SocialJpaSpecificationImpl specificationImpl;

	private SearchResponse getSearchResponse(List<SocialPerson> personRecord, SearchRequest searchRequest) {
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
		Query[] queries = searchRequest.getMessage().getSearchRequest().get(0).getSearchCriteria().getQuery();
		log.info("Queries:===== " + queries);
		Specification<SocialPersonRecord> specificationFromFilters = null;
		List<QueryExpression> queryExpressions = new ArrayList<>();
		for (Query query : queries) {
			if (query.getExpression1() != null) {
				QueryExpression queryExpression = customQueryMapper.mapToQueryExpression(query);
				queryExpressions.add(queryExpression);
			}
		}

		specificationFromFilters = getSpecificationFromFilters(queryExpressions, specificationFromFilters);
		specificationFromFilters = getSpecificationFromFilters(queryExpressions, specificationFromFilters);

		return getSearchResponseBySpecification(searchRequest, specificationFromFilters);

	}

	private SearchResponse getSearchResponseBySpecification(SearchRequest searchRequest,
			Specification<SocialPersonRecord> specificationFromFilters) {
		List<org.spdci.searchregistry.pojo.social.SocialPersonRecord> personRecord;
		if (specificationFromFilters == null) {

			personRecord = socialPersonRecordRepository.findAll();

			return getResponse(searchRequest, personRecord);

		} else {
			personRecord = socialPersonRecordRepository.findAll(specificationFromFilters);

			return getResponse(searchRequest, personRecord);
		}
	}

	private SearchResponse getResponse(SearchRequest searchRequest, List<SocialPersonRecord> personRecord) {
		List<Integer> ids = personRecord.stream().map(SocialPersonRecord::getId).collect(Collectors.toList());
		List<SocialPerson> personDataList = socialPersonRepository.findAllById(ids);

		return getSearchResponse(personDataList, searchRequest);
	}

	private Specification<SocialPersonRecord> getSpecificationFromFilters(List<QueryExpression> filter,
			Specification<SocialPersonRecord> specificationFromFilters) {
		List<QueryExpression> filterData = new ArrayList<>(filter);

		Specification<SocialPersonRecord> where = null;
		if (filterData.get(0).getExpression1() != null) {
			where = where(specificationImpl.createSpecificationForQueryExp(filterData.get(0).getExpression1()));
		}
		if (filterData.get(0).getExpression2() != null) {
			where = where.and(specificationImpl.createSpecificationForQueryExp(filterData.get(0).getExpression2()));
		}

		Specification<SocialPersonRecord> specification = specificationFromFilters == null ? where : specificationFromFilters;

		for (QueryExpression input : filterData) {

			Specification<SocialPersonRecord> exp1Spec = specificationImpl
					.createSpecificationForQueryExp(input.getExpression1());

			if (input.getCondition() != null) {
				Specification<SocialPersonRecord> exp2Spec = specificationImpl
						.createSpecificationForQueryExp(input.getExpression2());

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

	public List<Integer> findIdsByTypeAndValueforSocialPerson(String type, String value) {

		Specification<SocialPersonRecord> socialSpecification = specificationImpl
				.createSpecificationForQueryTypeforSocialPerson(type, value);

		List<SocialPersonRecord> socialPersonRecords = socialPersonRecordRepository.findAll(socialSpecification);

		List<Integer> ids = socialPersonRecords.stream().map(SocialPersonRecord::getId).collect(Collectors.toList());

		return ids;
	}

}
