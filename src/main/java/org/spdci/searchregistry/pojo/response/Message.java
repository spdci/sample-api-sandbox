package org.spdci.searchregistry.pojo.response;

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

    @JsonProperty("transaction_id")
    private String transactionId;

    @JsonProperty("correlation_id")
    private String correlationId;

    @JsonProperty("search_response")
    private List<SearchResponseObj> searchResponse;

}
