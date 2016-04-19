//
//  AboutTableViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    //@IBOutlet var tableSource: UITableView!
    //var RateSource = RateList()
    override func viewDidLoad() {
        super.viewDidLoad()
        //GetDate()
    }
    /*
    func GetDate(){
        //下面两句代码是从缓存中取出userid（入参）值
        let Accountid = NSUserDefaults.standardUserDefaults()
        let Account = Accountid.stringForKey("Account")
        let Passwordid = NSUserDefaults.standardUserDefaults()
        let Password = Passwordid.stringForKey("Password")
        let url = apiUrl + "channelrate"
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
                    self.RateSource = RateList(status.data!)
                    self.tableSource.reloadData()
                }
            }
        }
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AboutCell", forIndexPath: indexPath) as!AboutTableViewCell
        /*
        let rateInfo = self.RateSource.objectlist[indexPath.row]
        let dateformate = NSDateFormatter()
        dateformate.dateFormat = "MM-dd"
*/
        cell.Label.text = "布优销卡作为国内领先的充值卡收购平台，我们拥有巨大的经销商资源；同时拥有成熟的API接口技术(全自动化、人性化)，愿与国内各大网页游戏研发公司、游戏运营商等网商合作，目前支持14种充值卡海量回收，接口稳定、流畅，使您的利益最大化，共创双赢局面！"
        cell.images.image = UIImage(named: "布优")
        return cell
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
}
