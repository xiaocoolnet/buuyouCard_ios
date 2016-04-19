//
//  AccountDataList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class AccountDatatList: JSONJoy {
    var objectlist: [BankInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<BankInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<BankInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(BankInfo(childs))
        }
    }
    
    func append(list: [BankInfo]){
        self.objectlist = list + self.objectlist
    }
}

class BankInfo: JSONJoy{
    var BankMore:String?
    var BankCard:String?
    var BankACCount:String?
    var BankName:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        BankMore = decoder["BankMore"].string
        BankCard = decoder["BankCard"].string
        BankACCount = decoder["BankACCount"].string
        BankName = decoder["BankName"].string
    }
    
}
