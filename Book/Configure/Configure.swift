//
//  Configure.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import Foundation


let ScreenWidth = UIScreen.mainScreen().bounds.size.width

let ScreenHeigh = UIScreen.mainScreen().bounds.size.height

let MainColor   = UIColor(colorLiteralRed: 235/255, green: 114/255, blue: 118/255, alpha: 1)

/**隶变体字体name*/
let fontName = "Bauhaus ITC"

/**RGB*/
func RGB(r:Float,g:Float,b:Float)->UIColor {
    return UIColor(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}