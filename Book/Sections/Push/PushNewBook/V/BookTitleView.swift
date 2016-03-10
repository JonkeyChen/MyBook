//
//  BookTitleView.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

@objc protocol BookTitleDelegate{
    optional func bookTitleChoiceCover()
}

class BookTitleView: UIView {

    var BookCover:UIButton?
    
    var BookName:JVFloatLabeledTextField?
    
    var BookEditor:JVFloatLabeledTextField?
    
    var delegate:BookTitleDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.BookCover = UIButton(frame: CGRectMake(10,8,110,141))
        self.BookCover?.setImage(UIImage(named: "Cover"), forState:.Normal)
        self.addSubview(self.BookCover!)
        self.BookCover?.addTarget(self, action: Selector("choiceCover"), forControlEvents: .TouchUpInside)
        
        self.BookName = JVFloatLabeledTextField(frame: CGRectMake(128,7+40,ScreenWidth-128-15,30))
        self.BookName?.placeholder = "书名"
        self.BookName?.font = UIFont(name: fontName, size: 14)
        self.BookName?.floatingLabelFont = UIFont(name: fontName, size: 14)
        self.addSubview(self.BookName!)
        
        self.BookEditor = JVFloatLabeledTextField(frame: CGRectMake(128,7+40+30+40,ScreenWidth-128-15,30))
        self.BookEditor?.placeholder = "作者"
        self.BookEditor?.font = UIFont(name: fontName, size: 14)
        self.BookEditor?.floatingLabelFont = UIFont(name: fontName, size: 14)
        self.addSubview(self.BookEditor!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not implemeted")
    }
    
    func choiceCover(){
        self.delegate?.bookTitleChoiceCover!()
    }

}
