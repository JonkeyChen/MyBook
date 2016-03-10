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

        let etlbl = UILabel(frame: CGRectMake(0,0,100,20))
        etlbl.center = self.view.center
        etlbl.text  = "哈哈啊哈，陈胜华"
        etlbl.adjustsFontSizeToFitWidth = true
        etlbl.font  = UIFont(name: fontName, size: 14)
        self.view.addSubview(etlbl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
