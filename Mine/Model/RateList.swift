//
//  RateList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class RateList: JSONJoy {
    var objectlist: [RateInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<RateInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<RateInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(RateInfo(childs))
        }
    }
    
    func append(list: [RateInfo]){
        self.objectlist = list + self.objectlist
    }
}

class RateInfo: JSONJoy{
    var ChannelName:String?
    var ChannelRate:String?
    var ChannelState:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        ChannelName = decoder["ChannelName"].string
        ChannelRate = decoder["ChannelRate"].string
        ChannelState = decoder["ChannelState"].string
    }
    
}



