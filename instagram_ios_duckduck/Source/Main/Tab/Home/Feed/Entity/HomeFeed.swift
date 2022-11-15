//
//  HomeFeed.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/09.
//

class HomeFeed{
    static let shared = HomeFeed()
    
    var homeFeedList: [HomeFeedResult] = [HomeFeedResult(postID: 0, profileImg: "", uniqueName: "", imgUrls: [""], isLike: false, postLikeUsernames: [""], postLikeCount: 0, content: "", hashtags: [""], comments:  [CommentElement(comment: RecommentClass(commentID: 0, profileImg: "", name: "", content: "", likeCount: 0, timeDiff: "", isLike: false, recommentID: 0), recomment: [RecommentClass(commentID: 0, profileImg: "", name: "", content: "", likeCount: 0, timeDiff: "", isLike: false, recommentID: 0)])], date: "")]
    
    var count: Int {self.homeFeedList.count}
    
    public func setHomeFeedData(result: [HomeFeedResult]){
        homeFeedList = result
    }
    public func getHomeFeedData() -> [HomeFeedResult]{
        return homeFeedList
    }
}
