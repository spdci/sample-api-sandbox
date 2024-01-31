package org.spdci.searchregistry.pojo.request;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@JsonInclude
public class Message {



    @JsonIgnoreProperties("transaction_id")
    private String transactionId;

    @JsonProperty("search_request")
    private List<SearchRequestObj> searchRequest;

}
