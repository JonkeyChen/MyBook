//
//  PushNewBookVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

class PushNewBookVC: UIViewController ,BookTitleDelegate,PhotoPickerDelegate,VPImageCropperDelegate,UITableViewDelegate,UITableViewDataSource{
    
    var BookTitle:BookTitleView?
    
    var tableView:UITableView?
    
    var titleArray:Array<String> = []
    
    var Book_Title:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        //1.初始化书名，作者，封面
        self.BookTitle = BookTitleView(frame: CGRectMake(0,40,ScreenWidth,160))
        self.BookTitle?.delegate = self
        self.view.addSubview(self.BookTitle!)
        
        //2.初始化tableView
        self.tableView = UITableView(frame: CGRectMake(0, 200, ScreenWidth, ScreenHeigh-200), style: .Grouped)
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.view.addSubview(self.tableView!)
        
        //3.初始化数据
        self.titleArray = ["标题","评分","分类","书评"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     BookTitleDelegate
     */
    func bookTitleChoiceCover() {
        print("choiceCover")
        let photoPicker = PhotoPickerVC()
        photoPicker.delegate = self
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    /**
     PhotoPickerDelegate
     */
    func photoGetImageFromPicker(image: UIImage) {
        let CroVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, ScreenWidth, ScreenWidth*1.273), limitScaleRatio: 3)
        CroVC.delegate = self
        self.presentViewController(CroVC, animated: true) { () -> Void in
            
        }
    }
    
    /**
     VPImageCropperDelegate
     */
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.BookTitle?.BookCover?.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    /**
     UITableViewDelegate && UITableViewDataSource
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        if(indexPath.row != 1){
            cell.accessoryType = .DisclosureIndicator
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontName, size: 15)
        cell.detailTextLabel?.font = UIFont(name: fontName, size: 13)
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = self.Book_Title
            break
        case 1:
            
            break
        case 2:
            
            break
        case 3:
            
            break
        default:
            break
        }
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.tableViewSelectTitle()
            break
        case 1:
            self.tableViewSelectScore()
            break
        case 2:
            self.tableViewSelectType()
            break
        case 3:
            self.tableViewSelectDescription()
            break
        default:
            break
            
        }
        
    }
    /**
     *  选择标题
     */
    func tableViewSelectTitle(){
        let vc = Push_TitleVC()
        GeneralFactory.efAddTitleWithTitle(vc)
        vc.callBack = ({(Title:String)->Void in
            self.Book_Title  = Title
            self.tableView?.reloadData()
        })
        self.presentViewController(vc, animated: true) { () -> Void in
        }
    }
    /**
     *  选择评分
     */
    func tableViewSelectScore(){
        
    }
    /**
     *  选择分类
     */
    func tableViewSelectType(){
        let vc = Push_TypeVC()
        GeneralFactory.efAddTitleWithTitle(vc)
        self.presentViewController(vc, animated: true) { () -> Void in
        }
    }
    /**
     *  选择书评
     */
    func tableViewSelectDescription(){
        let vc = Push_DescriptionVC()
        GeneralFactory.efAddTitleWithTitle(vc)
        self.presentViewController(vc, animated: true) { () -> Void in
        }
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
