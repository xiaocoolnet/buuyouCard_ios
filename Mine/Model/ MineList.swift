//
//   MineList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class MineList: JSONJoy {
    var objectlist: [MineInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<MineInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<MineInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(MineInfo(childs))
        }
    }
    
    func append(list: [MineInfo]){
        self.objectlist = list + self.objectlist
    }
}

class MineInfo: JSONJoy{
    var UserRealName:String?
    var Email:String?
    var PassWord:String?
    
    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        UserRealName = decoder["UserRealName"].string
        Email = decoder["Email"].string
        PassWord = decoder["PassWord"].string
    }
    
}
