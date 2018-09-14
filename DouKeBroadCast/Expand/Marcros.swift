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


// 定义带有参数的常量
func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
	return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

func stringOfClass(_ cls: AnyClass) -> String {
	return NSStringFromClass(cls).components(separatedBy: ".").last!
}

func rayPrint(_ str:String) {
	print("L: \(#line)  M:\(#function) C:" + str)
}
