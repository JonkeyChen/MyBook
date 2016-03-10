//
//  Push_TypeVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class Push_TypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Top Left action
     */
    func efOnClickLeft(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /**
     Top Right action
     */
    func efOnClickRight(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
