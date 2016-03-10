//
//  AppDelegate.swift
//  Book
//
//  Created by Tianjian on 16/3/9.
//  Copyright © 2016年 oneyd.me. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        AVOSCloud.setApplicationId("OGP6aK5ef5Azq69i9NJaIfJ0-gzGzoHsz", clientKey: "iV3wUlSu9OkUYNJbrfK2NWr0")
        
        let _rankVC   = UINavigationController(rootViewController: RankVC())
        let _searchVC = UINavigationController(rootViewController: SearchVC())
        let _pusVC    = UINavigationController(rootViewController: PushVC())
        let _circleVC = UINavigationController(rootViewController: CircleVC())
        let _moreVC   = UINavigationController(rootViewController: MoreVC())
        
        _rankVC.tabBarItem   = UITabBarItem(title: "排行榜", image: UIImage(named: "IconTabBioNomarl"),    selectedImage: UIImage(named: "IconTabBioPress"))
        _searchVC.tabBarItem = UITabBarItem(title: "发现",  image: UIImage(named: "IconTabTimeNomarl"),    selectedImage: UIImage(named: "IconTabTimePress"))
        _pusVC.tabBarItem    = UITabBarItem(title: "",      image: UIImage(named: "IconTabUserOneNomarl"), selectedImage: UIImage(named: "IconTabUserOnePress"))
        _circleVC.tabBarItem = UITabBarItem(title: "圈子",  image: UIImage(named: "IconTabUserTwoNoarml"), selectedImage: UIImage(named: "IconTabUserTwoPress"))
        _moreVC.tabBarItem   = UITabBarItem(title: "更多",  image: UIImage(named: "IconTabMoreNomarl"),    selectedImage: UIImage(named: "IconTabMorePress"))
        
        let _tabBarVC = UITabBarController()
        _tabBarVC.viewControllers = [_rankVC,_searchVC,_pusVC,_circleVC,_moreVC]
        _rankVC.tabBarController?.tabBar.tintColor = MainColor
        
        self.window = UIWindow(frame: CGRectMake(0,0,ScreenWidth,ScreenHeigh))
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = _tabBarVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
}

