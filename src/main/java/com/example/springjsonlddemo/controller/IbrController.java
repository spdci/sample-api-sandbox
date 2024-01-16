package com.example.springjsonlddemo.controller;

import com.example.springjsonlddemo.pojo.request.SearchRequest;
import com.example.springjsonlddemo.pojo.response.SearchResponse;
import com.example.springjsonlddemo.service.ISearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Slf4j
public class IbrController {

    @Autowired
    ISearchService iSearchService;


    @PostMapping("/searchPerson")
    public SearchResponse searchReq(@RequestBody SearchRequest request) {
        log.info("Search Req  Controller");
        return iSearchService.searchPersonData(request);

    }


}
