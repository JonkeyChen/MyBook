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

        
        return
        if AVUser.currentUser() == nil {
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(loginVC, animated: true, completion: { () -> Void in
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
