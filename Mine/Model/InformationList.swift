//
//  InformationList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class InformationList: JSONJoy {
    var objectlist: [DataInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<DataInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<DataInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(DataInfo(childs))
        }
    }
    
    func append(list: [DataInfo]){
        self.objectlist = list + self.objectlist
    }
}

class DataInfo: JSONJoy{
    var UserRealName:String?
    var Email:String?
    var Userid:String?
    var RealTel:String?
    var MsnQQ:String?
    var WebName:String?
    var WebUrl:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        UserRealName = decoder["UserRealName"].string
        Email = decoder["Email"].string
        Userid = decoder["Userid"].string
        RealTel = decoder["RealTel"].string
        MsnQQ = decoder["MsnQQ"].string
        WebName = decoder["WebName"].string
        WebUrl = decoder["WebUrl"].string
        }
    
}
