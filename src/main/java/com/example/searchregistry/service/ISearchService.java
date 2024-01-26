package com.example.searchregistry.service;


import com.example.searchregistry.pojo.request.SearchRequest;
import com.example.searchregistry.pojo.response.SearchResponse;

public interface ISearchService {

    SearchResponse searchPersonData(SearchRequest searchRequest);

}
