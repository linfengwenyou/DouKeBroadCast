//
//  ExtensionColor.swift
//  DouKeBroadCast
//
//  Created by fumi on 2018/9/14.
//  Copyright © 2018年 fumi. All rights reserved.
//

import Foundation

extension UIColor {
    //
    class func hexadecimalColor(value : UInt) -> UIColor {
        
       return UIColor.init(red: CGFloat((value & 0xFF0000) >> 16) / 255.0, green: CGFloat((value & 0x00FF00) >> 8) / 255.0, blue: CGFloat(value & 0x0000FF) / 255.0, alpha: 1)
    }
}
