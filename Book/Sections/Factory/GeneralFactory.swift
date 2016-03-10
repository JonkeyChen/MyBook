//
//  GeneralFactory.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class GeneralFactory: NSObject {
    
    static func efAddTitleWithTitle(target:UIViewController,titleLeft:String="关闭",titleRight:String="确认"){
        
        let _etbtnLeft = UIButton(frame: CGRectMake(10,20,40,20))
        _etbtnLeft.setTitle(titleLeft, forState: .Normal)
        _etbtnLeft.contentHorizontalAlignment = .Left
        _etbtnLeft.setTitleColor(MainColor, forState: .Normal)
        _etbtnLeft.titleLabel?.font = UIFont(name: fontName, size: 14)
        target.view.addSubview(_etbtnLeft)

        let _etbtnRight = UIButton(frame: CGRectMake(ScreenWidth-40-10,20,40,20))
        _etbtnRight.setTitle(titleRight, forState: .Normal)
        _etbtnRight.contentHorizontalAlignment = .Right
        _etbtnRight.setTitleColor(MainColor, forState: .Normal)
        _etbtnRight.titleLabel?.font = UIFont(name: fontName, size: 14)
        target.view.addSubview(_etbtnRight)
        
        _etbtnLeft.addTarget(target, action: Selector("efOnClickLeft"), forControlEvents: .TouchUpInside)
        _etbtnRight.addTarget(target, action: Selector("efOnClickRight"), forControlEvents: .TouchUpInside)
    }
}
