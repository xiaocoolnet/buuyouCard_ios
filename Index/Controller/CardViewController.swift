//
//  CardViewController.swift
//  BuuYou

//  Created by 牛尧 on 16/5/9.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh

class CardViewController: UIViewController ,ZHDropDownMenuDelegate,UITableViewDelegate,UITableViewDataSource{
    var OrderSource = OrderList()
    
    @IBOutlet var menu: ZHDropDownMenu!
    @IBOutlet var tableSource: UITableView!
    @IBOutlet var CardPassword: UITextField!
    @IBOutlet var CardNumber: UITextField!
    @IBOutlet var SubmitButton: UIButton!
    //定义全局变量data，用来接收下拉菜单选择框的值
    var data:String!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        //GetDate()
        menu.options = ["5","10","15","20","25","30","50","100","200","300","500","1000"] //设置下拉列表项数据
        menu.editable = false //禁止编辑
        menu.defaultValue = "100" //设置默认值
        menu.showBorder = false   //不显示边框
            //设置代理
        menu.delegate = self
            
        self.navigationController?.navigationBar.hidden = false
            
            //点击
        //SubmitButton.addTarget(self, action: Selector("Next"), forControlEvents:UIControlEvents.TouchUpInside)
        SubmitButton.addTarget(self, action: Selector("Button"), forControlEvents:UIControlEvents.TouchUpInside)

            self.tableSource.delegate = self
            self.tableSource.dataSource = self
           
    }
    //选择完后回调
    func dropDownMenu(menu: ZHDropDownMenu!, didChoose index: Int) {
        print("\(menu) choosed at index \(index)")
        data = menu.options[index]
        //print(data)
    }
    
    //编辑完成后回调
    func dropDownMenu(menu: ZHDropDownMenu!, didInput text: String!) {
        print("\(menu) input text \(text)")
    }
    //点击提交按钮，先进行点卡寄售，再查看订单
    func Button(){
        if Next()==true{
            //GetDate()
            DropDownUpdate()
        }
    }
    func DropDownUpdate(){

         self.tableSource.headerView = XWRefreshNormalHeader(target: self, action: "GetDate")
         self.tableSource.headerView?.beginRefreshing()
    }

    func Next()->Bool{
        if PandKong()==true{
           Yanzheng(data)
            return true
        }
        else{
            return false
        }
    }
    
    func Yanzheng(data:String){
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let url = apiUrl+"cardsales"
        let params = [
            "data":"\(Account!),\(Password!),\(data),\(self.CardNumber.text!),\(self.CardPassword.text!)"
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
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "寄售成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
            }
        }
    }
    
    func PandKong()->Bool{
        
        if(CardNumber.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入卡号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        
        if(CardPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        else{
            return true
        }
 }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func GetDate(){
        //下面两句代码是从缓存中取出userid（入参）值
        
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let url = apiUrl + "orderlist"
        let param = [
            "data":"\(Account!),\(Password!),2016-04-20,,,,,,3,1,10,1"
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = HttpY(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                
                if(status.status == 0){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view,animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                
                if(status.status == 1){
                     self.tableSource.headerView?.endRefreshing()
                    self.OrderSource = OrderList(status.data!)
                    self.tableSource.reloadData()
                }
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderCell", forIndexPath: indexPath) as!OrdersTableViewCell
      let orderInfo = self.OrderSource.objectlist[indexPath.row]
      let dateformate = NSDateFormatter()
      dateformate.dateFormat = "MM-dd"
      cell.CardName.text = orderInfo.ChannelName!
      cell.PayStatus.text = orderInfo.GateMsg!
      cell.CardNumber.text = orderInfo.CardNumber!
      cell.PayTime.text = orderInfo.PayDate!
        //强制类型转换
      cell.OrderMoney.text = String(orderInfo.OrderMoney!)
      cell.Realmoney.text = String(orderInfo.Realmoney!)
        return cell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
}
