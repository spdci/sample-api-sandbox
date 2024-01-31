package org.spdci.searchregistry.pojo.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonInclude
public class SearchResponseObj {

    @JsonProperty("reference_id")
    private String referenceId;

    @JsonProperty("timestamp")
    private String timestamp;

    @JsonProperty("status")
    private String status;

    @JsonProperty("status_reason_code")
    private String statusReasonCode;

    @JsonProperty("status_reason_message")
    private String statusReasonMessage;

    private ResponseData data;

    private Pagination pagination;

    private String locale;
}
