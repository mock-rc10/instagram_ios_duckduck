//
//  changeUrlDataManager.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//


import Alamofire
import Combine

class postContent{
    func postContent(token: String, parameters: PostRequest) {
        print(token)
        print(parameters)
        AF.request("\(Constant.BASE_URL)/api/posts", method: .post ,parameters: parameters, encoder: JSONParameterEncoder(),headers:  ["X-ACCESS-TOKEN": token])
            .responseDecodable(of: postResponse.self) { response in
                print(response)
                switch response.result{
                case .success(let response):
                    print(response)
                    PostViewController().didSuccessPostFeed()
                    /*
                    if response.isSuccess == true{
                        print("등록 성공")
                    }
                    else{
                        print("등록 실패")
                    }
                     */
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    //delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
           
        }
    
    }
    
}
        
            
    
        
