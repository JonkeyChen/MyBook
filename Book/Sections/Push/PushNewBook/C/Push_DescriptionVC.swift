//
//  Push_DescriptionVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

typealias Push_DescriptionBlock = (description:String) -> Void

class Push_DescriptionVC: UIViewController {

    var evtxvWrite:JVFloatLabeledTextView?
    
    var callBack:Push_DescriptionBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.initTextView()
        
        self.initKeyBoardNotificaiton()
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
        self.callBack!(description: (self.evtxvWrite?.text)!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    初始化textView
    */
    func initTextView(){
        self.evtxvWrite = JVFloatLabeledTextView(frame: CGRectMake(8, 58, ScreenWidth-16, ScreenHeigh-50-8))
        self.view.addSubview(self.evtxvWrite!)
        self.evtxvWrite?.placeholder = "            你可以在这里填写详细的评价，吐槽，介绍～～"
        self.evtxvWrite?.font = UIFont(name: fontName, size: 17)
        self.view.tintColor = UIColor.grayColor()
        self.evtxvWrite?.becomeFirstResponder()
    }
    /**
    注册通知
    */
    func initKeyBoardNotificaiton(){
        XKeyBoard.registerKeyBoardHide(self)
        XKeyBoard.registerKeyBoardShow(self)
    }
    /**
    键盘遮挡
    */
    func keyboardWillShowNotification(notification:NSNotification){
        let rect = XKeyBoard.returnKeyBoardWindow(notification)
        self.evtxvWrite?.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
    }
    func keyboardWillHideNotification(notification:NSNotification){
        self.evtxvWrite?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }

}
