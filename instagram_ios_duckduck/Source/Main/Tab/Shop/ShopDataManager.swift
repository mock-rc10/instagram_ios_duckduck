//
//  ShopDataManager.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

import Alamofire

class ShopDataManager{
    func GetShopData(delegate: ShopViewController) {
        AF.request("\(Constant.BASE_URL)/api/shop", method: .get,parameters: nil,headers:  nil)
            .responseDecodable(of: ShopResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessShopLoad(result: result)
                    }
                    // 실패했을 때
                    else {
                        print("실패")
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
