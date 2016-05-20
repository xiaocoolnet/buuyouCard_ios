//
//  ConsignTableViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/5/13.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import XWSwiftRefresh
class ConsignTableViewController: UITableViewController {
    
    var OrderSource = OrderList()
    @IBOutlet var tableSource: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DropDownUpdate()
        
    }
    
    func DropDownUpdate(){
        self.tableSource.headerView = XWRefreshNormalHeader(target: self, action: "Yanzheng")
        self.tableSource.headerView?.beginRefreshing()
    }
    
    func Yanzheng(){
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let Numberid = NSUserDefaults.standardUserDefaults()
        let Number = Numberid.stringForKey("Number")
        let Pickid = NSUserDefaults.standardUserDefaults()
        let Pick = Pickid.stringForKey("Pick")

       //取缓存整型变量的值
        var userDefault = NSUserDefaults.standardUserDefaults()
        var intValue = userDefault.integerForKey("Int")
        //两种形式取字符串型变量的值
        var DateValue = userDefault.objectForKey("NSString") as! NSString
        //var Date = userDefault.objectForKey("String") as! String
        let url = apiUrl+"orderlist"
        // 点卡类型入参问题待解决
        //let str = "QQ卡"
        let params = [
             "data":"\(Account!),\(Password!),\(DateValue),\(Pick),,,,\(Number!),\(intValue),1,100,1"
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
                    self.tableSource.headerView?.endRefreshing()
                    self.OrderSource = OrderList(status.data!)
                    self.tableSource.reloadData()
                }
            }
        }
    }

    override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   override  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderSource.count
    }
    
   override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConsignCell", forIndexPath: indexPath) as!ConsignTableViewCell
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
    override  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
   override   func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
}