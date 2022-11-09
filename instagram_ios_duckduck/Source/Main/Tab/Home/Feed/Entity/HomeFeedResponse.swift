//
//  HomeFeedResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/09.
//

// MARK: - Welcome
struct HomeFeedResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [HomeFeedResult]?
}

// MARK: - Result
struct HomeFeedResult: Codable {
    let postID: Int
    let profileImg: String
    let uniqueName: String
    let imgUrls: [String]
    let isLike: Bool
    let postLikeUsernames: [String]
    let postLikeCount: Int
    let content: String
    let hashtags: [String]
    let comments: [CommentElement]
    let date: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case profileImg, uniqueName, imgUrls, isLike, postLikeUsernames, postLikeCount, content, hashtags, comments, date
    }
}
// MARK: - CommentElement
struct CommentElement: Codable {
    let comment: RecommentClass
    let recomment: [RecommentClass]
}

// MARK: - RecommentClass
struct RecommentClass: Codable {
    let commentID: Int
    let profileImg, name, content: String
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

