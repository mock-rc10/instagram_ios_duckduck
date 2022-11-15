//
//  PostContent.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

import UIKit

class PostContent{
    static let shared = PostContent()
    
    //var count: Int {self.StoryList.count}
    var contentImages: [UIImage] = []
    var contentUrls: [String] = []
    var content: String = ""
    var contentData: Content = Content(content: "", imgUrls: [""])
    
    public func setContentImage(result: [UIImage]){
        contentImages = result
    }
    public func setContent(content: String){
        self.content = content
    }
    public func setContentData(result: [String]){
        print(result)
        //contentUrls = result
        contentData = Content(content: self.content, imgUrls: result)
        print(contentData)
    }
    public func getContentData() -> Content{
        return self.contentData
    }
}

struct Content{
    var content: String
    var imgUrls: [String]
}
