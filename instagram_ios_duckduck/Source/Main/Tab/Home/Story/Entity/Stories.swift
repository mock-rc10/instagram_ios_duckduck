//
//  Stories.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import Foundation

class Stories{
    static let shared = Stories()
    
    var count: Int {self.StoryList.count}
    var StoryList: [StoryListResult] = []

    public func addStory(result: [StoryListResult]){
        StoryList = result
    }
}
        
struct Story{
    let userID: Int
    let uniqueName, profileImgURL: String
    /*
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case uniqueName
        case profileImgURL = "profileImgUrl"
    }
     */
}
