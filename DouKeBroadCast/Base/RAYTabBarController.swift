//
//  RAYTabBarController.swift
//  DouKeBroadCast
//
//  Created by fumi on 2018/9/14.
//  Copyright © 2018年 fumi. All rights reserved.
//

import Foundation

class RAYTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首页
        let homeVC = RAYHomeController()
        self.addChildViewController(childerVC: homeVC, title: "首页", normalImg: "tab_classify_icon", selectedImg: "tab_classify_select_icon")
        //嘉宝箱
        let treasureBoxVC = RAYBaseViewController()
        self.addChildViewController(childerVC: treasureBoxVC, title: "信息", normalImg: "tab_special_icon", selectedImg: "tab_special_select_icon")
        
        //我嘉
        let myShowVC = RAYBaseViewController()
        self.addChildViewController(childerVC: myShowVC, title: "购物车", normalImg: "tab_car_icon", selectedImg: "tab_car_select_icon")
        
        //会员中心
        let memberCenterVc = RAYBaseViewController()
        self.addChildViewController(childerVC: memberCenterVc, title: "个人中心", normalImg: "tab_user_icon", selectedImg: "tab_user_select_icon")
        
        self.selectedIndex = 0
    }
    
    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        let color = UIColor.hexadecimalColor(value: 0xff3f8c)
        self.tabBar.tintColor = color
        
        childerVC.title = title as String
        
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        let naVc = RAYNavigationController(rootViewController: childerVC)
        naVc.tabBarItem = tabItem
        
        self.addChildViewController(naVc)
    }
}
