//
//  OrderList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class OrderList: JSONJoy {
    var objectlist: [OrderInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<OrderInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<OrderInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(OrderInfo(childs))
        }
    }
    
    func append(list: [OrderInfo]){
        self.objectlist = list + self.objectlist
    }
}

class OrderInfo: JSONJoy{
    var ChannelName:String?
    var CardNumber:String?
    var PayDate:String?
    var OrderMoney:Int?
    var Realmoney:Int?
    var GateMsg:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        ChannelName = decoder["ChannelName"].string
        CardNumber = decoder["CardNumber"].string
        PayDate = decoder["PayDate"].string
        OrderMoney = decoder["OrderMoney"].integer
        Realmoney = decoder["Realmoney"].integer
        GateMsg = decoder["GateMsg"].string
    }
    
}
