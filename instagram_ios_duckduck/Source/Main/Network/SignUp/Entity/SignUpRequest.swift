//
//  SignUpRequest.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

struct SignUpRequest: Encodable{
    var facebook: Bool
    var email: String
    var password: String
    var name: String
    var uniqueName: String
}
