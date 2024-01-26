package com.example.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude
@EqualsAndHashCode()
public class QueryExpression {


    @JsonProperty("seq_num")
    private int seqNum;

    private Expression expression1;

    private String condition;

    private Expression expression2;

}
