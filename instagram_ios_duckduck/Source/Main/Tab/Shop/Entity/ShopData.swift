//
//  ShopData.swift
//  instagram_ios_duckduck
//
//  Created by 권유정 on 2022/11/16.
//

class ShopData{
    static let shared = ShopData()
    
    var shopData: [String] = []
    
    func setShopData(result: [String]) {
        shopData = result
        
    }
    func getShopData() -> [String]{
        return shopData
    }
}
