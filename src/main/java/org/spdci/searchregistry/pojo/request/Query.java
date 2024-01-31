package org.spdci.searchregistry.pojo.request;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@JsonInclude
public class Query {
	private Integer seq_num;
	private Expression expression1;
	private String condition;
	private Expression expression2;

}
