package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude
@EqualsAndHashCode()
public class QueryTypeValue {

    private String type;
    private String value;

}
