//
//  SignUpUser.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import Foundation

class SignUpUser{
    static let shared = SignUpUser()
    
    var email: String = ""
    var name: String = ""
    var uniqueName: String = ""
    var password: String = ""
    var faceBookLoginStatus: Bool = false
    
    
    public func addEmail(email: String){
        self.email = email
    }
    public func addName(name: String){
        self.name = name
    }
    public func addUniqueName(unique: String){
        self.uniqueName = unique
    }
    public func addPassword(password: String){
        self.password = password
    }
    public func addUser() -> User{
        var user: User = User(email: self.email, name: self.name, uniqueName: self.uniqueName, password: self.password, faceBookLoginStatus: false)
        
        return user
    }
}
        
struct User{
    var email, name, uniqueName, password: String
    var faceBookLoginStatus: Bool = false
}
