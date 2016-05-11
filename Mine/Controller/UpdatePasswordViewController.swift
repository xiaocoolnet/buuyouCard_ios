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
        self.navigationController?.navigationBar.hidden = false
                nextButton.addTarget(self, action: Selector("Next"), forControlEvents:UIControlEvents.TouchUpInside)
    }
    
    func Next(){
        if PandKong()==true{
            Yanzheng()
        }
    }
    
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
                    hud.labelText = "密码修改成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
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
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
