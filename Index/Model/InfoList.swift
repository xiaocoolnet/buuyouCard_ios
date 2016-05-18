//
//  InfoList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/18.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class InfoList: JSONJoy {
    var objectlist: [MationInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<MationInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<MationInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(MationInfo(childs))
        }
    }
    
    func append(list: [MationInfo]){
        self.objectlist = list + self.objectlist
    }
}

class MationInfo: JSONJoy{
    var allnum:Int?
    var allmoney:Double?
    var todaynum:Double?
    var todaymoney:Double?
    var yesterdaynum:Double?
    var yesterdaymoney:Double?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        allnum = decoder["allnum"].integer
        allmoney = decoder["allmoney"].double
        todaynum = decoder["todaynum"].double
        todaymoney = decoder["todaymoney"].double
        yesterdaynum = decoder["yesterdaynum"].double
        yesterdaymoney = decoder["yesterdaymoney"].double
    }
    
}



