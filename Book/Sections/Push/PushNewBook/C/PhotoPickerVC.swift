//
//  PhotoPickerVC.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

protocol PhotoPickerDelegate{
    func photoGetImageFromPicker(image:UIImage)
}

class PhotoPickerVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var alert:UIAlertController?
    
    var picker = UIImagePickerController!()

    var delegate:PhotoPickerDelegate!
    
    init(){
        super.init(nibName:nil,bundle:nil)
        //背景透明设置
        self.modalPresentationStyle = .OverFullScreen
        self.view.backgroundColor = UIColor.clearColor()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker = UIImagePickerController()
        self.picker.allowsEditing = false//自己截图
        self.picker.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if(self.alert == nil){
            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            self.alert?.addAction(UIAlertAction(title: "从相册选择", style: .Default, handler: { (action) -> Void in
                self.efTakePhoto()
            }))
            self.alert?.addAction(UIAlertAction(title: "相机", style: .Default, handler: { (action) -> Void in
                self.efCamera()
            }))
            self.alert?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.alert?.popoverPresentationController?.sourceView = self.view
            self.presentViewController(self.alert!, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    /**
      打开相册
     */
    func efTakePhoto(){
        self.picker.sourceType = .PhotoLibrary
        self.presentViewController(self.picker, animated: true) { () -> Void in
            
        }
    }
    /**
     打开相机
     */
    func efCamera(){
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){//有照相机
            self.picker.sourceType = .Camera
            self.presentViewController(self.picker, animated: true, completion: { () -> Void in
                
            })
        } else {//无相机
            let alertView = UIAlertController(title: "此机型无相机", message: nil, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                })
            }))
            self.presentViewController(alertView, animated: true, completion: { () -> Void in
            })
        }
    }
    
    /**
     UIImagePickerControllerDelegate
     */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.delegate.photoGetImageFromPicker(image)
            })
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
