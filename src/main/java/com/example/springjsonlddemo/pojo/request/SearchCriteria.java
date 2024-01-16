package com.example.springjsonlddemo.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.github.jsonldjava.utils.Obj;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@JsonInclude
@NoArgsConstructor
public class SearchCriteria  {

    private String version;

    @JsonProperty("reg_event_type")
    private String regEventType;

    @JsonProperty("query_type")
    private String queryType;

    @JsonProperty("query")
    private Object query;
    private List<Sort> sort;
    private Pagination pagination;
    private String consent;
    private String authorize;
}
