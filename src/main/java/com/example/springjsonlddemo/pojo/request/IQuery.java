package com.example.springjsonlddemo.pojo.request;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

//@JsonTypeInfo(use = JsonTypeInfo.Id.NAME)
//@JsonSubTypes({
//        @JsonSubTypes.Type(value = QueryTypeValue.class, name = "TypeValue"),
//        @JsonSubTypes.Type(value = QueryExpression.class, name = "Expression")
//})
public interface IQuery {

}
