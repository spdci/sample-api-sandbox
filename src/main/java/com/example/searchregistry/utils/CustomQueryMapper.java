package com.example.searchregistry.utils;


import com.example.searchregistry.pojo.request.Expression;
import com.example.searchregistry.pojo.request.QueryExpression;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomQueryMapper {

    @Autowired
    ObjectMapper mapper;

    public QueryExpression mapToQueryExpression(Map<String, Object> expressionQueryMap) {
        QueryExpression queryExpression = new QueryExpression();
        queryExpression.setSeqNum((int) expressionQueryMap.get("seq_num"));
        queryExpression.setCondition((String) expressionQueryMap.get("condition"));

        Map<String, Object> expression1Map = (Map<String, Object>) expressionQueryMap.get("expression1");
        queryExpression.setExpression1(mapToExpression(expression1Map));

        Map<String, Object> expression2Map = (Map<String, Object>) expressionQueryMap.get("expression2");
        queryExpression.setExpression2(mapToExpression(expression2Map));

        return queryExpression;
    }

    private Expression mapToExpression(Map<String, Object> expressionMap) {
        try {
            return mapper.convertValue(expressionMap, Expression.class);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
        return null;
    }

}
