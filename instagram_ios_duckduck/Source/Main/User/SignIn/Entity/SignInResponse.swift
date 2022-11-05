//
//  SignInResponse.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

struct SignInResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignInResult?
}

struct SignInResult: Codable {
    let accessToken: String
}
