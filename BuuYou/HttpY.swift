//
//  HttpY.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/15.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import Foundation

class HttpY: JSONJoy{
    var status:Int?
    //数组类型的data
    var data:JSONDecoder?
    var errorData:String?
    var uid:String?
    init(){
    }
    required init(_ decoder:JSONDecoder){
        status = decoder["status"].integer
        if status == 1{
            data = decoder["data"]
        }else{
            errorData = decoder["data"].string
        }
        
        
    }
}
