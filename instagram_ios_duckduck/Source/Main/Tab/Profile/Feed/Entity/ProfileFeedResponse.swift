//
//  ProfileFeedResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/07.
//

struct ProfileFeedResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ProfileFeedResult]?
}

// MARK: - Result
struct ProfileFeedResult: Codable {
    let profileImg, uniqueName: String
    let imgUrls: [String]
    let isLike: Bool
    let postLikeUsernames: [String]
    let postLikeCount: Int
    let content: String
    let hashtags, comments: [String]
    let date: String
}
