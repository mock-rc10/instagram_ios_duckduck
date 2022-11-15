//
//  SearchFeed.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

class SearchFeed{
    static let shared = SearchFeed()
    
    var searchFeedData: [SearchResult] = []
    
    func setSearchFeed(result: [SearchResult]) {
        searchFeedData = result
        
    }
    func setappendSearchFeed(result: SearchResult){
        searchFeedData.append(result)
    }
}
