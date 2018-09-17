//
//  Marcros.swift
//  DouKeBroadCast
//
//  Created by LIUSONG on 2018/9/14.
//  Copyright © 2018年 Rayer. All rights reserved.
//

import Foundation

// 定义普通常量
//let a = 10

/// 全屏宽度
let kScreenWitdh = UIScreen.main.bounds.width
/// 全屏高度，不含状态栏高度
let kScreenHeight = UIScreen.main.bounds.height

/// tabbar切换视图控制器高度
let kTabbarHeight = 49.0
/// 搜索视图高度
let kSearchBarHeight = 45.0
/// 状态栏高度
let kStatusBarHeight    = 20.0
/// 导航栏高度
let kNavigationHeight   = 44.0

// 定义带有参数的常量
func colorRGB(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
	return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

func stringOfClass(_ cls: AnyClass) -> String {
	return NSStringFromClass(cls).components(separatedBy: ".").last!
}

func rayPrint(_ str:String) {
	print("L: \(#line)  M:\(#function) C:" + str)
}
