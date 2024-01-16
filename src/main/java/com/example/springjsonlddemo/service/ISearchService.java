package com.example.springjsonlddemo.service;

import com.example.springjsonlddemo.pojo.request.SearchRequest;
import com.example.springjsonlddemo.pojo.response.SearchResponse;

public interface ISearchService {

    SearchResponse searchPersonData(SearchRequest searchRequest);

}
