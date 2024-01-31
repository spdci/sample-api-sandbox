package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private Query[] query;
    private List<Sort> sort;
    private Pagination pagination;
    private String consent;
    private String authorize;
}
