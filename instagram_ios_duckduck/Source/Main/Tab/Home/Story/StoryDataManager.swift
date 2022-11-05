//
//  StoryDataManager.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/05.
//

import Alamofire

class StoryDataManager{
    func GetStories(delegate: HomeViewController, token: String?) {
        AF.request("\(Constant.BASE_URL)/api/stories", method: .get,parameters: nil,headers:  ["X-ACCESS-TOKEN": token!])
            .responseDecodable(of: StoryListResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessStoriesDisplay(result: result)
                    }
                    // 실패했을 때
                    else {
                        print("실패 코드에 따라 나누기")
                        /*
                        switch response.code {
                        case 2001: //delegate.failedToRequest(message: "JWT를 입력해주세요.")
                        case 2002: //delegate.failedToRequest(message: "유효하지 않은 JWT입니다.")
                        default: //delegate.failedToRequest(message: "피드백을 주세요")
                        }
                         */
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    //delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
