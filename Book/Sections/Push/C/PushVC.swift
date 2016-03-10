//
//  PushVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavgationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavgationBar(){
        let _navigationView = UIView(frame: CGRectMake(0,-20,ScreenWidth,65))
        _navigationView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.addSubview(_navigationView)
        
        let _etbtnAddBook = UIButton(frame: CGRectMake(20,20,ScreenWidth,65))
        _etbtnAddBook.setImage(UIImage(named: "IconPuls") ,forState:.Normal)
        _etbtnAddBook.setTitle("    新建书评", forState: .Normal)
        _etbtnAddBook.setTitleColor(UIColor.blackColor(), forState: .Normal)
        _etbtnAddBook.titleLabel?.font = UIFont(name: fontName, size: 15)
        _etbtnAddBook.contentHorizontalAlignment = .Left
        _etbtnAddBook.addTarget(self, action: Selector("efOnClcikPushNewBook"), forControlEvents: .TouchUpInside)
        _navigationView.addSubview(_etbtnAddBook)
    }
    
    func efOnClcikPushNewBook(){
        let _newBookVC = PushNewBookVC()
        GeneralFactory.efAddTitleWithTitle(_newBookVC, titleLeft: "关闭", titleRight: "发布")
        self .presentViewController(_newBookVC, animated: true, completion: nil)
    }
}
