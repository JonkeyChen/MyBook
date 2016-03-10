//
//  RegisterVC.swift
//  Book
//
//  Created by Tianjian on 16/3/10.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var evtxfUserName: UITextField!
    @IBOutlet weak var evtxfPassword: UITextField!
    @IBOutlet weak var evtxfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func efOnClickRegister(sender: AnyObject) {
        print("注册")
        let user = AVUser()
        user.username = self.evtxfUserName.text
        user.password = self.evtxfPassword.text
        user.email    = self.evtxfEmail.text
        user.signUpInBackgroundWithBlock { (success, error) -> Void in
            if success {
                ProgressHUD.showSuccess("注册成功,请验证邮箱")
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                })
            } else {
                if error.code == 125 {
                    ProgressHUD.showError("邮箱不合法")
                } else if error.code == 203 {
                    ProgressHUD.showError("该邮箱已经注册")
                } else if error.code == 202 {
                    ProgressHUD.showError("用户名已经存在")
                } else {
                    ProgressHUD.showError("注册失败")
                }
            }
        }
    }

    @IBAction func efOnClickClose(sender: AnyObject) {
        print("关闭")
        self.dismissViewControllerAnimated(true) { () -> Void in
        }
    }


}
