//
//  ForgetPasswordViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/10.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet var AccountText: UITextField!
    @IBOutlet var phoneNumberText: UITextField!
    @IBOutlet var codeText: UITextField!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var getCodeButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var NewPassword: UITextField!
    var timeNamal:NSTimer!
    var timeNow:NSTimer!
    var count:Int = 60
    var alerView0:UIAlertView!
    var alerView1:UIAlertView!
    var alerView2:UIAlertView!
    var alerView3:UIAlertView!
    var alerView4:UIAlertView!
    //定义全局变量data
    var data:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = false
        getCodeButton.addTarget(self, action: Selector("GetCode"), forControlEvents: UIControlEvents.TouchUpInside)
        nextButton.addTarget(self, action: Selector("Next"), forControlEvents: UIControlEvents.TouchUpInside)
        codeLabel.hidden = true
        // Do any additional setup after loading the view.
    }
    
    func GetCode(){
        //if (AccountText.text!.isEmpty||AccountText.text?.characters.count != 11)
        
        if (AccountText.text!.isEmpty)
        {
            var alerView:UIAlertView = UIAlertView()
            alerView.title = "账号输入错误"
            alerView.message = "请重新输入"
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 1
            alerView.show()
        }
         else if (phoneNumberText.text!.isEmpty||phoneNumberText.text?.characters.count != 11)
        {
            var alerView:UIAlertView = UIAlertView()
            alerView.title = "手机号输入错误"
            alerView.message = "请重新输入"
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 1
            alerView.show()
        }
        else
        {
            
            var alerView:UIAlertView = UIAlertView()
            alerView.title = "发送验证码到"
            alerView.message = "\(phoneNumberText.text!)"
            alerView.addButtonWithTitle("取消")
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 0
            alerView.show()
            
        }
        
    }
    
    func Next(){
        if PandKong()==true{
            Yanzheng(data)
        }
    }
    //有参函数，使用data
    func Yanzheng(data:String){
        let url = apiUrl+"userupdpwd"
        let params = [
             "data":"\(self.AccountText.text!),\(self.codeText.text!),\(self.NewPassword.text!),2,\(data)"
            //"Email":AccountText.text!,
           // "ValiCode":codeText.text!
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
                let status = Http(JSONDecoder(json!))
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
                    hud.labelText = "修改成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    /*
                    let Userid = NSUserDefaults.standardUserDefaults()
                    Userid.setValue(status.data?.Userid, forKey: "Userid")
                    //let uid = userid.valueForKey("userid")
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ForgetPasswordView")
                    self.navigationController?.pushViewController(vc, animated: true)
                  */
                }
            }
        }
    }
    
    func PandKong()->Bool{
        
        if(AccountText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入账号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        
        if(phoneNumberText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入手机号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        
        if(codeText.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入验证码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(NewPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入新密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
        
    }
    
    func timeDow()
    {
        var time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: "updateTime", userInfo: nil, repeats: true)
        timeNow = time1
    }
    
    func showRepeatButton()
    {
        codeLabel.hidden=true
        getCodeButton.hidden = false
        getCodeButton.enabled = true
    }
    
    func updateTime()
    {
        count--
        if (count <= 0)
        {
            count = 60
            self.showRepeatButton()
            timeNow.invalidate()
        }
        codeLabel.text = "\(count)S"
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.tag == 0
        {
            if buttonIndex == 1
            {
                self.senderMessage()
                getCodeButton.hidden = true
                codeLabel.hidden = false
                self.timeDow()
            }
        }
        if alertView.tag == 1
        {}
        if alertView.tag == 2
        {}
    }
    //好几个入参值全部写成了一个入参的情况
    func senderMessage()
    {
        let url = apiUrl+"userpwd"
        let param = [
            "data":"\(self.AccountText.text!),\(self.phoneNumberText.text!)"
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                //result.data.string
                //print(request)
                //print(json)
                //print(response)
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
                let status = Http(JSONDecoder(json!))
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
                    print(status.data)
                   self.data = status.data
                    
            }
                
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
