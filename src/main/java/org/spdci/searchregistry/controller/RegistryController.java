package org.spdci.searchregistry.controller;

import org.spdci.searchregistry.pojo.request.SearchRequest;
import org.spdci.searchregistry.pojo.response.SearchResponse;
import org.spdci.searchregistry.service.ISearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class RegistryController {

	@Autowired
	@Qualifier("IbrRecordImpl")
	ISearchService ibrImpl;

	@Autowired
	@Qualifier("SocialRecordImpl")
	ISearchService socialImpl;

	@PostMapping("/registry/sync/search")
	public SearchResponse searchIbrReg(@RequestBody SearchRequest request) {
		log.info("Search Req  Controller");
		if (request.getHeader().getReceiverId().equalsIgnoreCase("ibr")) {
			return ibrImpl.searchPersonData(request);
		} else if (request.getHeader().getReceiverId().equalsIgnoreCase("social")) {
			return socialImpl.searchPersonData(request);
		} else {
			throw new RuntimeException("Invalid registry");
		}

	}

}
