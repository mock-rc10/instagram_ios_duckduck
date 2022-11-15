//
//  PostRequest.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/14.
//

struct PostRequest: Encodable{
    var content: String
    var imgUrls: [String]
    var hashtags: [String]
}
