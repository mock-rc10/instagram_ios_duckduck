//
//  ReelsResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

// MARK: - Welcome
struct ReelsResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ReelsResult]?
}

// MARK: - Result
struct ReelsResult: Codable {
    let reelsID: Int
    let profileImg: String
    let uniqueName: String
    let vodURL: String
    let isLike: Bool
    let reelsLikeUsernames: [String]
    let reelsLikeCount: Int
    let content: String
    let hashtags: [String]
    let comments: [ReelsCommentElement]
    let date: String

    enum CodingKeys: String, CodingKey {
        case reelsID = "reelsId"
        case profileImg, uniqueName
        case vodURL = "vodUrl"
        case isLike, reelsLikeUsernames, reelsLikeCount, content, hashtags, comments, date
    }
}

// MARK: - CommentElement
struct ReelsCommentElement: Codable {
    let comment: ReelsRecommentClass
    let recomment: [ReelsRecommentClass]
}

// MARK: - RecommentClass
struct ReelsRecommentClass: Codable {
    let commentID: Int
    let profileImg: String
    let name, content: String
    let likeCount: Int
    let timeDiff: String
    let isLike: Bool
    let recommentID: Int?

    enum CodingKeys: String, CodingKey {
        case commentID = "commentId"
        case profileImg, name, content, likeCount, timeDiff, isLike
        case recommentID = "recommentId"
    }
}
