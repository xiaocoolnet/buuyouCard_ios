//
//  InformationTableViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/16.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class InformationTableViewController: UITableViewController {

    @IBOutlet var tableSource: UITableView!
    var InfoSource = InformationList()
    override func viewDidLoad() {
        super.viewDidLoad()
        GetDate()
    }
    
    func GetDate(){
        //下面两句代码是从缓存中取出userid（入参）值
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let url = apiUrl + "userlogin"
        let param = [
            "data":"\(Account!),\(Password!)"
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
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == 1){
                    self.InfoSource = InformationList(status.data!)
                    self.tableSource.reloadData()
                }
                //print(dataInfo)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IDCell", forIndexPath: indexPath) as!InformationTableViewCell
        //let cellname = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as!InformationTableViewCell
        let dataInfo = self.InfoSource.objectlist[indexPath.row]
        let dateformate = NSDateFormatter()
        dateformate.dateFormat = "MM-dd"
        cell.UseridLabel.text = dataInfo.Email!
        cell.NameLabel.text = dataInfo.UserRealName!
        cell.Email.text = dataInfo.Email!
        cell.PhoneNumber.text = dataInfo.RealTel!
        cell.Tencent.text = dataInfo.MsnQQ!
        cell.WebName.text = dataInfo.WebName!
        cell.WebAddress.text = dataInfo.WebUrl!
        //cellname.NameLabel.text = dataInfo.UserRealName!
      

              return cell
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }

}
