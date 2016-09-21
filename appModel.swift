//
//  appModel.swift
//  LoveFree
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 kimCheng. All rights reserved.
//

import UIKit

class AppModel: NSObject {
    var name:String?
    var iconUrl:String?
    var applicationId:String?
    var currentPrice:String?
    var downloads:String?
    var categoryName:String?
    var lastPrice:String?
    var shares:String?
    var favorites:String?
    var expireDatetime:String?
    var starCurrent:String?
    var description1: String?
    static func modelWith(dic:[String:AnyObject])->AppModel{
    let  model = AppModel()
        model.setValuesForKeysWithDictionary(dic)
        model.description1 = dic["description"] as! String
        return model
    
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}
