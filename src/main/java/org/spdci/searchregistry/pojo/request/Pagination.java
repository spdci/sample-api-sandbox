package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude
public class Pagination {

    @JsonProperty("page_size")
    private int pageSize;

    @JsonProperty("page_number")
    private int pageNumber;
}
