//
//  RankVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class RankVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if AVUser.currentUser() == nil {
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(loginVC, animated: true, completion: { () -> Void in
            })
        }
        
        self.initLoginOut()
    }
    
    func initLoginOut(){
        let etbtnLogout = UIButton(frame: CGRectMake(60,100,ScreenWidth-120,30))
        etbtnLogout.setTitle("退出登陆", forState: .Normal)
        etbtnLogout.setTitleColor(UIColor.redColor(), forState: .Normal)
        etbtnLogout.addTarget(self, action: Selector("efOnClickLogOut"), forControlEvents: .TouchUpInside)
        self.view.addSubview(etbtnLogout)
    }
    
    func efOnClickLogOut(){
        AVUser.logOut()
        let story = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = story.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(loginVC, animated: true, completion: { () -> Void in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
