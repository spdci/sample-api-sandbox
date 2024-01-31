package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
@JsonInclude
public class Expression {

    @JsonProperty("attribute_name")
    private String attributeName;

    @JsonProperty("operator")
    private String operator;

    @JsonProperty("attribute_value")
    private String attributeValue;

}
