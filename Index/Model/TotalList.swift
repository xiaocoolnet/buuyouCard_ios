//
//  TotalList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class TotalList: JSONJoy {
    var objectlist: [TotalInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<TotalInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<TotalInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(TotalInfo(childs))
        }
    }
    
    func append(list: [TotalInfo]){
        self.objectlist = list + self.objectlist
    }
}

class TotalInfo: JSONJoy{
    var ChannelName:String?
    var PayDate:String?
    var Realmoney:Int?
    var OrderMoney:Int?
    var UserMoney:Double?
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        ChannelName = decoder["ChannelName"].string
        PayDate = decoder["PayDate"].string
        Realmoney = decoder["Realmoney"].integer
        OrderMoney = decoder["OrderMoney"].integer
        UserMoney = decoder["UserMoney"].double
    }
    
}

