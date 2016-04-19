//
//  LogList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class LogList: JSONJoy {
    var objectlist: [LogInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<LogInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<LogInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(LogInfo(childs))
        }
    }
    
    func append(list: [LogInfo]){
        self.objectlist = list + self.objectlist
    }
}

class LogInfo: JSONJoy{
    var LoginIP:String?
    var LoginDate:String?
    var LoginArea:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        LoginIP = decoder["LoginIP"].string
        LoginDate = decoder["LoginDate"].string
        LoginArea = decoder["LoginArea"].string
    }
    
}


