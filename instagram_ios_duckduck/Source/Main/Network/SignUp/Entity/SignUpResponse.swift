//
//  SignUpResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

struct SignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignUpResult?
}

// MARK: - Result
struct SignUpResult: Codable {
    let accessToken: String
}
