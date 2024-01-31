package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonInclude
public class SearchRequestObj  {


    @JsonProperty("reference_id")
    private String referenceId;

    @JsonProperty("timestamp")
    private String timestamp;

    @JsonProperty("search_criteria")
    private SearchCriteria searchCriteria;

    @JsonProperty("locale")
    private String locale;
}
