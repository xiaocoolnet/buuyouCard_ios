//
//  UpdatePasswordViewController.swift
//  BuuYou
//
//  Created by 牛尧 on 16/4/19.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//
import UIKit
import Alamofire
import MBProgressHUD
class UpdatePasswordViewController: UIViewController {

    @IBOutlet var AccountText: UITextField!
    @IBOutlet var OldPassword: UITextField!
    @IBOutlet var NewPassword: UITextField!
    @IBOutlet var againPassword: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GetCode()
        self.navigationController?.navigationBar.hidden = false
        //getCodeButton.addTarget(self, action: Selector("GetCode"), forControlEvents: UIControlEvents.TouchUpInside)
        nextButton.addTarget(self, action: Selector("Next"), forControlEvents: UIControlEvents.TouchUpInside)
        //codeLabel.hidden = true
        // Do any additional setup after loading the view.
    }
    /*
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
    */
    func Next(){
        if PandKong()==true{
            Yanzheng()
        }
    }
    //有参函数，使用data
    func Yanzheng(){
        let url = apiUrl+"userupdpwd"
        let params = [
            //"data":"\(self.AccountText.text!),\(self.OldPassword.text!),\(self.NewPassword.text!),2,\(data)"
            //"Email":AccountText.text!,
            // "ValiCode":codeText.text!
            "data":"\(self.AccountText.text!),\(self.OldPassword.text!),\(self.NewPassword.text!),1"
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
                    hud.labelText = "修改成功,请返回登录界面"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    /*
                    let Userid = NSUserDefaults.standardUserDefaults()
                    Userid.setValue(status.data?.Userid, forKey: "Userid")
                    //let uid = userid.valueForKey("userid")
                    
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Login")
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
        
        if(OldPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入原密码"
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
        if(againPassword.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请再次输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(NewPassword.text! != againPassword.text! ){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入相同密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        else{
            return true
        }
    }
    
      /*
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.tag == 0
        {
            if buttonIndex == 1.
            {
                self.senderMessage()
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
*/
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
