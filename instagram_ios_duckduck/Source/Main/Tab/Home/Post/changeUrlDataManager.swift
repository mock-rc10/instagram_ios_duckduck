//
//  changeUrlDataManager.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/11.
//


import Alamofire
import Combine

class changeUrl{
    func ChangeUrl(_ images: [UIImage]) {
        for i in images{
            let imageData = i.jpegData(compressionQuality: 1)!
            let url = "\(Constant.BASE_URL)/api/uploadFiles"
            upload(image: imageData, to: url)
            
        }
    }
    func upload(image: Data, to url: String){
        AF.upload(multipartFormData: { multiPart in
            multiPart.append(image, withName: "fileList", mimeType: "file")
        }, to: url, headers: nil).responseDecodable(of: PostImageUrlResponse.self) { response in
            switch response.result {
            case .success(let response):
                // 성공했을 때
                if response.isSuccess, let result = response.result {
                    print("성공")
                    PostViewController().didSuccessChangeUrl(result: result)
                }
                // 실패했을 때
                else {
                    print("실패 코드에 따라 나누기")
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                PostViewController().failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}
        
            
    
        
