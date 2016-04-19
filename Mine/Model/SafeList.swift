//
//  SafeList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//


import Foundation
class SafeList: JSONJoy {
    var objectlist: [SafeInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<SafeInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<SafeInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(SafeInfo(childs))
        }
    }
    
    func append(list: [SafeInfo]){
        self.objectlist = list + self.objectlist
    }
}

class SafeInfo: JSONJoy{
    var SafeCode:String?
    var Email:String?
    var RealTel:String?
    //var BankName:String?
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        SafeCode = decoder["SafeCode"].string
        Email = decoder["Email"].string
        RealTel = decoder["RealTel"].string
       //BankName = decoder["BankName"].string
    }
    
}

