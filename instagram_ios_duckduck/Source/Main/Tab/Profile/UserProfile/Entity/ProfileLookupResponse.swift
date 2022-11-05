//
//  ProfileLookupResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

struct ProfileLookupResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProfileLookupResult?
}

// MARK: - Result
struct ProfileLookupResult: Codable {
    let uniqueName, name, imgURL: String
    let postCount, followingCount, followerCount: Int

    enum CodingKeys: String, CodingKey {
        case uniqueName, name
        case imgURL = "imgUrl"
        case postCount, followingCount, followerCount
    }
}
