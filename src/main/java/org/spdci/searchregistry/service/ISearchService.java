package org.spdci.searchregistry.service;


import org.spdci.searchregistry.pojo.request.SearchRequest;
import org.spdci.searchregistry.pojo.response.SearchResponse;

public interface ISearchService {

    SearchResponse searchPersonData(SearchRequest searchRequest);

}
