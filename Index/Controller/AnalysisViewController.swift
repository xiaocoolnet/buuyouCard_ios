//
//  AnalysisViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/14.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class AnalysisViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var tableSource: UITableView!
    @IBOutlet var SubmitButton: UIButton!
    @IBOutlet var detaButton: UIButton!
    @IBOutlet var detaButton2: UIButton!
    @IBOutlet var datePicker:UIDatePicker!
    @IBOutlet var datePicker2: UIDatePicker!
    //定义全局变量pickDate，用来接收用户选择的日期
    var pickDate:String?
    var pickDate2:String?
    var AnalySource = AnalyList()
    var datePickerHidden = true
    var datePickerHidden2 = true
    override func viewDidLoad() {
         super.viewDidLoad()
         //进入view controller时先隐藏datepicker
         datePicker.hidden = datePickerHidden
         datePicker2.hidden = datePickerHidden2
        self.navigationController?.navigationBar.hidden = false
        SubmitButton.addTarget(self, action: Selector("Next"), forControlEvents:UIControlEvents.TouchUpInside)
        //点击“请选择”按钮，触发日期选择控件
        detaButton.addTarget(self, action: Selector("toggleDatePicker"), forControlEvents:UIControlEvents.TouchUpInside)
        detaButton2.addTarget(self, action: Selector("toggleDatePicker2"), forControlEvents:UIControlEvents.TouchUpInside)
        self.tableSource.delegate = self
        self.tableSource.dataSource = self
        
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
        detaButton.setTitle(pickDate, forState: .Normal)
            }
    func datePickerChanged2() {
        //将日期格式汉化
        datePicker2.locale = NSLocale(localeIdentifier: "zh_CN")
        // 选择的日期显示在detaButton2样式上
        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        pickDate2 = dateFormatter2.stringFromDate(datePicker2.date)
        detaButton2.setTitle(pickDate2, forState: .Normal)
    }
    
    func Next(){
            Yanzheng(pickDate!,pickDate2: pickDate2!)
    }
        
    func Yanzheng(pickDate:String, pickDate2:String){
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let url = apiUrl+"analyzeinchannel"
        let params = [
            "data":"\(Account!),\(Password!),\(pickDate),\(pickDate2),"
        ]
        Alamofire.request(.GET, url, parameters: params).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
                let status = HttpY(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == 0){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                
                if(status.status == 1){
                    print("Success")
                    self.AnalySource = AnalyList(status.data!)
                    self.tableSource.reloadData()
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnalySource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnalysisCell", forIndexPath: indexPath) as!AnalysisTableViewCell
        let analyInfo = self.AnalySource.objectlist[indexPath.row]
        let dateformate = NSDateFormatter()
        dateformate.dateFormat = "MM-dd"
        cell.CardName.text = analyInfo.Mname!
        //强制类型转换
        cell.SuccessNumber.text = String(analyInfo.TruePrice!)
        cell.SuccessOrder.text = String(analyInfo.Mnum!)
        cell.Number.text = String(analyInfo.UserPrice!)
        return cell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }

}
