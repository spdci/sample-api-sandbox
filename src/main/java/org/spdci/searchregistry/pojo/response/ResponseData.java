package org.spdci.searchregistry.pojo.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import org.spdci.searchregistry.pojo.IPerson;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude
public class ResponseData {

    @JsonProperty("version")
    private String version;

    @JsonProperty("reg_records")
    private List<? extends IPerson> regRecords;
}
