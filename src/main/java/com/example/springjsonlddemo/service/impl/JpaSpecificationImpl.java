package com.example.springjsonlddemo.service.impl;

import com.example.springjsonlddemo.dto.PersonRecord;
import com.example.springjsonlddemo.pojo.request.Expression;
import com.example.springjsonlddemo.pojo.request.QueryExpression;
import jakarta.persistence.criteria.Path;
import org.aspectj.weaver.ast.Expr;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class JpaSpecificationImpl {

    public Specification<PersonRecord> createSpecificationForQueryExp(Expression input) {

        switch (input.getOperator()) {

            case "eq":
                return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(input.getAttributeName()),
                        castToRequiredType(root.get(input.getAttributeName()).getJavaType(), input.getAttributeValue()));

            case "ge":
                return (root, query, criteriaBuilder) -> criteriaBuilder.notEqual(root.get(input.getAttributeName()),
                        castToRequiredType(root.get(input.getAttributeName()).getJavaType(), input.getAttributeValue()));

            case "gt":
                return (root, query, criteriaBuilder) -> criteriaBuilder.gt(root.get(input.getAttributeName()),
                        (Number) castToRequiredType(root.get(input.getAttributeName()).getJavaType(), input.getAttributeValue()));

            case "lt":
                return (root, query, criteriaBuilder) -> criteriaBuilder.lt(root.get(input.getAttributeName()),
                        (Number) castToRequiredType(root.get(input.getAttributeName()).getJavaType(), input.getAttributeValue()));

            case "in":
                System.out.println("root.get(input.getAttributeName()()) : " + input.getAttributeName());
                System.out.println("root.get(input.getAttributeValue()()) : " + input.getAttributeValue());
                return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(input.getAttributeName()))
                        .value(Arrays.asList(input.getAttributeValue().split(",")));

            default:
                throw new RuntimeException("Operation not supported!!!");
        }
    }

    private Object castToRequiredType(Class fieldType, String value) {
        if (fieldType.isAssignableFrom(Double.class)) {
            return Double.valueOf(value);
        } else if (fieldType.isAssignableFrom(Integer.class)) {
            return Integer.valueOf(value);
        } else if (Enum.class.isAssignableFrom(fieldType)) {
            return Enum.valueOf(fieldType, value);
        } else if (fieldType.isAssignableFrom(String.class)) {
            return String.valueOf(value);
        }
        return null;
    }

    public Specification<PersonRecord> createSpecificationForQueryType(String type, String value) {
        return (root, query, criteriaBuilder) -> {
            Path<Object> attributePath = root.get(type);
            if (attributePath.getJavaType() == String.class) {
                return criteriaBuilder.equal(attributePath, value);
            } else if (attributePath.getJavaType() == Integer.class) {
                return criteriaBuilder.equal(attributePath, Integer.parseInt(value));
            } else if (attributePath.getJavaType() == Double.class) {
                return criteriaBuilder.equal(attributePath, Double.parseDouble(value));
            }
            return null;
        };
    }

}
