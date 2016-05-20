//
//  FinanceList.swift
//  BuuYou
//
//  Created by Mac on 16/5/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class FinList: JSONJoy {
    var objectlist: [FinInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<FinInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<FinInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(FinInfo(childs))
        }
    }
    
    func append(list: [FinInfo]){
        self.objectlist = list + self.objectlist
    }
}

class FinInfo: JSONJoy{
    var TotalBalance:String?
    var AvailableBalance:String?
    var UserMoney:String?
    var UserWithdrawMoney:String?
    init() {
    }
    required init(_ decoder: JSONDecoder){
        TotalBalance = decoder["TotalBalance"].string
        AvailableBalance = decoder["AvailableBalance"].string
        UserMoney = decoder["UserMoney"].string
        UserWithdrawMoney = decoder["UserWithdrawMoney"].string
    
    }
    
}


