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

    public func setContentData(result: [UIImage]){
        contentImages = result
    }
}
