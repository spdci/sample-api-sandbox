package com.example.searchregistry.pojo.request;

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

    @JsonProperty("sender_id")
    private String senderId;

    @JsonProperty("sender_uri")
    private String senderUri;

    @JsonProperty("receiver_id")
    private String receiverId;

    @JsonProperty("total_count")
    private String totalCount;

    @JsonProperty("is_msg_encrypted")
    private boolean isMsgEncrypted;

    private String meta;
}
