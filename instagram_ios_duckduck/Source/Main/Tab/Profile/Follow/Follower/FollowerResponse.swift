//
//  FollowerResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//
struct FollowerResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [FollowerResult]?
}

// MARK: - Result
struct FollowerResult: Codable {
    let userID: Int
    let uniqueName, name, imgURL: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case uniqueName, name
        case imgURL = "imgUrl"
    }
}
