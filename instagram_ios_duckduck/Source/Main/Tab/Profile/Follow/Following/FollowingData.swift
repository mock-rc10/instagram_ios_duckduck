//
//  FollowingData.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import Foundation
class SettingFollowing{
    static let shared = SettingFollowing()
    var user: [FollowingResult] = []
    
    func setFollowing(result: [FollowingResult]) {
        self.user = result
    }
    func getFollowing() -> [FollowingResult]{
        return self.user
    }
}
