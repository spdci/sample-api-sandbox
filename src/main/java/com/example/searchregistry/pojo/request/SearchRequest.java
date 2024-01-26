package com.example.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@JsonInclude
public class SearchRequest {

    private String signature;
    private Header header;

    private Message message;

}
