//
//  ConsignOrderViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/12.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//
import UIKit
import Alamofire
import MBProgressHUD

class ConsignOrderViewController: UIViewController ,ZHDropDownMenuDelegate{

    @IBOutlet var menu1: ZHDropDownMenu!
    @IBOutlet var menu2: ZHDropDownMenu!
    @IBOutlet var CardNumber: UITextField!
    @IBOutlet var SubmitButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePicker2: UIDatePicker!
    @IBOutlet var dateButton: UIButton!
    @IBOutlet var dateButton2: UIButton!
    
    //定义全局变量data，用来接收下拉菜单选择框的值
    var data1:String!
    var data2:String!
    var StuNumber:Int?
    var pickDate:String?
    var pickDate2:String?
    var datePickerHidden = true
    var datePickerHidden2 = true

    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = false
        //进入view controller时先隐藏datepicker
        datePicker.hidden = datePickerHidden
        datePicker2.hidden = datePickerHidden2
        //点击“请选择”按钮，触发日期选择控件
        dateButton.addTarget(self, action: Selector("toggleDatePicker"), forControlEvents:UIControlEvents.TouchUpInside)
        dateButton2.addTarget(self, action: Selector("toggleDatePicker2"), forControlEvents:UIControlEvents.TouchUpInside)

        menu1.options = ["所有类型","骏网一卡通","盛大卡","神州行","征途卡","QQ卡","联通卡","久游卡","网易卡","完美卡","搜狐卡","电信卡","纵游一卡通","天下一卡通","天宏一卡通","盛付通卡","光宇一卡通","京东E卡通","中石化加油卡"] //设置下拉列表项数据
        menu1.editable = false //禁止编辑
        menu1.defaultValue = "所有类型" //设置默认值
        menu1.showBorder = false   //不显示边框
        menu1.delegate = self
        
        menu2.options = ["所有状态","处理中","成功","失败"] //设置下拉列表项数据
        menu2.editable = false //禁止编辑
        menu2.defaultValue = "所有状态" //设置默认值
        menu2.showBorder = false   //不显示边框
        //设置代理
        menu2.delegate = self
        SubmitButton.addTarget(self, action: Selector("HuanCun"), forControlEvents:UIControlEvents.TouchUpInside)


    }
    //选择完后回调
    func dropDownMenu(menu: ZHDropDownMenu!, didChoose index: Int) {
        print("\(menu) choosed at index \(index)")
       data1 = menu1.options[index]
       data2 = menu2.options[index]
        //print(data2)
        if(data2 == "成功"){
            StuNumber = 1
        }
        
        if(data2 == "失败"){
            StuNumber = 2
        }
        
        if(data2 == "处理中"){
            StuNumber = 0
        }
        
        if(data2 == "所有状态")
        {
        StuNumber = 3
        }
        
    }
    
    //编辑完成后回调
    func dropDownMenu(menu: ZHDropDownMenu!, didInput text: String!) {
        print("\(menu) input text \(text)")
    }
    
    // datePicker控件显示隐藏开关
    func toggleDatePicker(){
        datePickerHidden = !datePickerHidden
        datePicker.hidden = datePickerHidden
    }
    func toggleDatePicker2(){
        datePickerHidden2 = !datePickerHidden2
        datePicker2.hidden = datePickerHidden2
    }
    // 选择datePicker控件的触发
    @IBAction func datePickerValue(sender: UIDatePicker) {
        datePickerChanged()
    }
    
    @IBAction func datePickerValue2(sender: UIDatePicker) {
        datePickerChanged2()
    }
    
    func datePickerChanged() {
        //将日期格式汉化
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        // 选择的日期显示在detaButton样式上
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        pickDate = dateFormatter.stringFromDate(datePicker.date)
        dateButton.setTitle(pickDate, forState: .Normal)
       
    }
    func datePickerChanged2() {
        //将日期格式汉化
        datePicker2.locale = NSLocale(localeIdentifier: "zh_CN")
        // 选择的日期显示在detaButton2样式上
        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        pickDate2 = dateFormatter2.stringFromDate(datePicker2.date)
        dateButton2.setTitle(pickDate2, forState: .Normal)
        }
    
    func HuanCun(){
        let  Number = NSUserDefaults.standardUserDefaults().setObject(self.CardNumber.text, forKey: "Number")
        let  Pick = NSUserDefaults.standardUserDefaults().setObject(pickDate2, forKey: "Pick")
        //缓存整型变量的值
        var userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setInteger(StuNumber!, forKey: "Int")
       //缓存字符串型变量的值
        userDefault.setObject(pickDate, forKey: "NSString")
        //userDefault.setObject(pickDate2, forKey: "String")
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

