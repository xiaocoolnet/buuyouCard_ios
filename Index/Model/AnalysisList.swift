//
//  AnalysisList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/14.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class AnalyList: JSONJoy {
    var objectlist: [AnalyInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<AnalyInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<AnalyInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(AnalyInfo(childs))
        }
    }
    
    func append(list: [AnalyInfo]){
        self.objectlist = list + self.objectlist
    }
}

class AnalyInfo: JSONJoy{
    var Mname:String?
    var Mnum:Int?
    var TruePrice:Int?
    var UserPrice:Double?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        Mname = decoder["Mname"].string
        Mnum = decoder["Mnum"].integer
        TruePrice = decoder["TruePrice"].integer
        UserPrice = decoder["UserPrice"].double
    }
    
}
