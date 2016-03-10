//
//  LoginVC.swift
//  Book
//
//  Created by Tianjian on 16/3/10.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var evtxfUserName: UITextField!
    @IBOutlet weak var evtxfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func efOnClickLogin(sender: AnyObject) {
        
        print("登录")
        return
        AVUser.logInWithUsernameInBackground(self.evtxfUserName.text, password: self.evtxfPassword.text) { (user,error) -> Void in
            if error == nil {
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                })
            } else if error.code == 210 {
                ProgressHUD.showError("用户名或密码错误")
            } else if error.code == 211 {
                ProgressHUD.showError("不存在该用户")
            } else if error.code == 216 {
                ProgressHUD.showError("未验证邮箱")
            } else if error.code == 1 {
                ProgressHUD.showError("操作频繁")
            } else {
                ProgressHUD.showError("登录失败")
            }
        }
    }



}
