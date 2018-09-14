//
//  ExtensionView.swift
//  DouKeBroadCast
//
//  Created by LIUSONG on 2018/9/15.
//  Copyright © 2018年 Rayer. All rights reserved.
//

import Foundation

protocol UIViewLoading {}
extension UIView : UIViewLoading {}
extension UIViewLoading where Self : UIView {
	
	static func loadFromNib() -> Self {
		print("loadFromNib")
		let nib = UINib(nibName: stringOfClass(self), bundle: nil)
		return nib.instantiate(withOwner: self, options: nil).first as! Self
	}

}
