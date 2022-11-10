//
//  PostImageUrl.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//

struct PostImageUrlResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [String]?
}
