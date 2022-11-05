//
//  SignInDataManager.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/01.
//

import Alamofire

class SignInDataManager{
    func postSignIn(_ parameters: SignInRequest, delegate: SignInViewController) {
        AF.request("\(Constant.BASE_URL)/api/auth/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignInResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessSignIn(result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2015: delegate.failedToRequest(message: "이메일을 입력해주세요.")
                        case 2016: delegate.failedToRequest(message: "이메일 형식을 확인해주세요.")
                        case 2019: delegate.failedToRequest(message: "비밀번호를 입력해주세요.")
                        case 3014: delegate.failedToRequest(message: "없는 이메일이거나 비밀번호가 틀렸습니다.")
                        default: delegate.failedToRequest(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
