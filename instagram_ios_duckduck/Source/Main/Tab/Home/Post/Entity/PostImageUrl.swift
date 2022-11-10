//
//  PostImageUrl.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import Foundation
class ImageUrl{
    static let shared = ImageUrl()
    
    //var count: Int {self.StoryList.count}
    var urlList: [String] = [""]

    public func setUrlListData(result: [String]){
        urlList = result
        //print(StoryList)
    }
}

