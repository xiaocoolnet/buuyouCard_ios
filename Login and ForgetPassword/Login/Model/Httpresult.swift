//
//  Httpresult.swift
//  BuuYou
//  Created by 牛尧 on 16/4/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation
class Httpresult: JSONJoy{
    var status:Int?
    var data:UserInfo?
    var errorData:String?
    var datastring:String?
    //var uid:String?
    init(){
    }
    required init(_ decoder:JSONDecoder){
        status = decoder["status"].integer
        if status == 1{
            data = UserInfo(decoder["data"])
        }else{
            errorData = decoder["data"].string
        }
        
    }
}

class UserInfo: JSONJoy {
    var Userid:String?
    //var schoolid:String?
    //var classid:String?
    init(){
    }
    required init(_ decoder:JSONDecoder){
        Userid = decoder["Userid"].string
        //classid = decoder["classid"].string
        //schoolid = decoder["schoolid"].string
    }

}