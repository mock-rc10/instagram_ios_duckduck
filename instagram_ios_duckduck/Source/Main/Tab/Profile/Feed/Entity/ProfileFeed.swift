//
//  ProfileFeed.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/07.
//

class SettingProfileFeed{
    static let shared = SettingProfileFeed()
    
    var profileFeed: [ProfileFeedLookupResult] = []
    
    func setProfileFeed(result: [ProfileFeedLookupResult]) {
        profileFeed = result
    }
}
