package com.example.springjsonlddemo.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@JsonInclude
public class Sort {

    @JsonProperty("attribute_name")
    private String attributeName;

    @JsonProperty("sort_order")
    private String sortOrder;

}
