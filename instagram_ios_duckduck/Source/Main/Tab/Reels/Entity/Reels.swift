//
//  Reels.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/15.
//

class SettingReels{
    static let shared = SettingReels()
    
    var reelsList: [ReelsResult] = []
    
    var count: Int {self.reelsList.count}
    
    public func setReelsData(result: [ReelsResult]){
        reelsList = result
    }
    public func getReelsData() -> [ReelsResult]{
        return reelsList
    }
}
