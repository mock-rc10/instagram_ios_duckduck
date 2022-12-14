//
//  postResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/14.
//

struct postResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
    
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "isSuccess"
        case code = "code"
        case message = "message"
        case result = "result"
    }
}

