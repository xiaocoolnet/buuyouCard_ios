//
//  IndexList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/21.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//


import Foundation

class IndexList: JSONJoy {
    var objectlist: [IndexInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<IndexInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<IndexInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(IndexInfo(childs))
        }
    }
    
    func append(list: [IndexInfo]){
        self.objectlist = list + self.objectlist
    }
}

class IndexInfo: JSONJoy{
    var LastTimes:String?
    var Email:String?
    var PassWord:String?
    init() {
    }
    required init(_ decoder: JSONDecoder){
        LastTimes = decoder["LastTimes"].string
        Email = decoder["Email"].string
        PassWord = decoder["PassWord"].string
    }
    
}

