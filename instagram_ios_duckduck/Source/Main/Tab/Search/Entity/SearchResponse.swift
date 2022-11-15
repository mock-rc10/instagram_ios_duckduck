//
//  SearchResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//


// MARK: - Welcome
struct SearchResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchResult]?
}

// MARK: - Result
struct SearchResult: Codable {
    let postID: Int
    let profileImg, uniqueName: String
    let imgUrls: [String]
    let isLike: Bool
    let postLikeUsernames: [String]
    let postLikeCount: Int
    let content: String
    let hashtags, comments: [String]
    let date: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case profileImg, uniqueName, imgUrls, isLike, postLikeUsernames, postLikeCount, content, hashtags, comments, date
    }
}
