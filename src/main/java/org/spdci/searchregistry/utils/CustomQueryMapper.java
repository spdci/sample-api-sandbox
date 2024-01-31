package org.spdci.searchregistry.utils;

import java.util.Map;

import org.spdci.searchregistry.pojo.request.Expression;
import org.spdci.searchregistry.pojo.request.Query;
import org.spdci.searchregistry.pojo.request.QueryExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class CustomQueryMapper {

	@Autowired
	ObjectMapper mapper;

	public QueryExpression mapToQueryExpression(Query query) {
		QueryExpression queryExpression = new QueryExpression();
		queryExpression.setSeqNum(query.getSeq_num());
		queryExpression.setCondition(query.getCondition());
		queryExpression.setExpression1(query.getExpression1());
		queryExpression.setExpression2(query.getExpression2());
		return queryExpression;
	}

}
