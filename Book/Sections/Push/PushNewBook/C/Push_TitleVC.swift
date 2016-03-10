//
//  Push_TitleVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias Push_TitleCallBack = (Title:String)->Void

class Push_TitleVC: UIViewController {

    var textField:UITextField?
    
    var callBack:Push_TitleCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField = UITextField(frame: CGRectMake(15,60,ScreenWidth-30,30))
        self.textField?.borderStyle = .RoundedRect
        self.textField?.placeholder = "书评标题"
        self.textField?.font = UIFont(name: fontName, size: 15)
        self.view.addSubview(self.textField!)
        
        self.textField?.becomeFirstResponder()//弹出键盘
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
        self.callBack?(Title: self.textField!.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
