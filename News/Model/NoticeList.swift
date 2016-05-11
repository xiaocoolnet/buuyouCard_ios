//
//  NoticeList.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/21.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class NoticeList: JSONJoy {
    var objectlist: [NoticeInfo]
    var count: Int{
        return self.objectlist.count
    }
    
    init(){
        objectlist = Array<NoticeInfo>()
    }
    required init(_ decoder: JSONDecoder) {
        
        objectlist = Array<NoticeInfo>()
        for childs: JSONDecoder in decoder.array!{
            objectlist.append(NoticeInfo(childs))
        }
    }
    
    func append(list: [NoticeInfo]){
        self.objectlist = list + self.objectlist
    }
}

class NoticeInfo: JSONJoy{
    var title:String?
    var datatime:String?
    var picpath:String?
    var website:String?    
    init() {
        
    }
    required init(_ decoder: JSONDecoder){
        title = decoder["title"].string
        datatime = decoder["datatime"].string
        picpath = decoder["picpath"].string
        website = decoder["website"].string
    }
    
}



