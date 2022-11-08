//
//  StoryListResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

// MARK: - Welcome
struct StoryListResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: StoryListResult?
}

// MARK: - Result
struct StoryListResult: Codable {
    let profile: Profile?
    let storyList: [Profile]?

   
}
// MARK: - Profile
struct Profile: Codable {
    let userId: Int
    let uniqueName, profileImgURL: String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case uniqueName
        case profileImgURL = "profileImgUrl"
    }
}
