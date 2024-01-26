package com.example.searchregistry.controller;

import com.example.searchregistry.pojo.request.SearchRequest;
import com.example.searchregistry.pojo.response.SearchResponse;
import com.example.searchregistry.service.ISearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Slf4j
public class IbrController {

    @Autowired
    @Qualifier("IbrRecordImpl")
    ISearchService ibrImpl;

    @Autowired
    @Qualifier("SocialRecordImpl")
    ISearchService socialImpl;

    @PostMapping("/ibr/registry/sync/search")
    public SearchResponse searchIbrReg(@RequestBody SearchRequest request) {
        log.info("Search Req  Controller");
        return ibrImpl.searchPersonData(request);

    }

    @PostMapping("/social/registry/sync/search")
    public SearchResponse searchSocialReg(@RequestBody SearchRequest request) {
        log.info("Search Req  Controller");
        return socialImpl.searchPersonData(request);
    }


}
