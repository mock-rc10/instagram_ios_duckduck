//
//  FollowerData.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import Foundation
class SettingFollower{
    static let shared = SettingFollower()
    var user: [FollowerResult] = []
    
    func setFollower(result: [FollowerResult]) {
        self.user = result
    }
    func getFollower() -> [FollowerResult]{
        return self.user
    }
}
