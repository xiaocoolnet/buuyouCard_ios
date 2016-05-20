//
//  LoseList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//


import Foundation
class LoseList: JSONJoy {
    var objectlist: [LoseInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<LoseInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<LoseInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(LoseInfo(childs))
        }
    }
    
    func append(list: [LoseInfo]){
        self.objectlist = list + self.objectlist
    }
}

class LoseInfo: JSONJoy{
    var ChannelName:String?
    var BillNO:String?
    var PayDate:String?
    var OrderMoney:Int?

    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        ChannelName = decoder["ChannelName"].string
        BillNO = decoder["BillNO"].string
        PayDate = decoder["PayDate"].string
        OrderMoney = decoder["OrderMoney"].integer
    }
    
}
