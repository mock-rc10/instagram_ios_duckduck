//
//  Profile.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import Foundation

class SettingProfile{
    static let shared = SettingProfile()
    var userProfile: ProfileLookupResult = ProfileLookupResult(uniqueName: "", name: "", imgURL: "", postCount: 0, followingCount: 0, followerCount: 0)
    
    func setProfile(result: ProfileLookupResult) {
        userProfile = result
    }
}
        
struct Profile{
    let uniqueName, name, imgURL: String
    let postCount, followingCount, followerCount: Int

   
}
