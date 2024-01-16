package com.example.springjsonlddemo.pojo.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@JsonInclude
public class Header {

    private String version;

    @JsonProperty("message_id")
    private String messageId;

    @JsonProperty("message_ts")
    private String messageTs;

    private String action;

    @JsonProperty("status")
    private String status;

    @JsonProperty("status_reason_code")
    private String statusReasonCode;

    @JsonProperty("status_reason_message")
    private String statusReasonMessage;

    @JsonProperty("total_count")
    private String totalCount;

    @JsonProperty("completed_count")
    private String completedCount;

    @JsonProperty("sender_id")
    private String senderId;

    @JsonProperty("receiver_id")
    private String receiverId;

    @JsonProperty("is_msg_encrypted")
    private boolean isMsgEncrypted;

    private String meta;
}
