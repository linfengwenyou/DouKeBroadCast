//
//  RAYMineController.swift
//  DouKeBroadCast
//
//  Created by LIUSONG on 2018/9/14.
//  Copyright © 2018年 Rayer. All rights reserved.
//

import UIKit


class RAYMineController: RAYBaseViewController {

	let headerView: RAYMineHeaderView = RAYMineHeaderView.loadFromNib()
	
	private var _model: RAYHomeModel?
	var model: RAYHomeModel? {		// 使用setter 和 getter必须把隐藏的成员变量定义出来
		get {
			return _model
		}
		set{
			_model = newValue
		}
	}

	var name:String? {	// 计算属性，省略了get
		return  "hello "+(_model?.description ?? "nothing")
	}
	
	lazy var name2: String = {
		let name2 = "hellow this is a demo"
		return name2
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		rayPrint("测试一下")
		print("line:\(#line) functionName:\(#function)")
		self.view.addSubview(self.headerView)
		self.headerView.snp.makeConstraints { (make) in
			make.width.equalTo(100)
			make.height.equalTo(200)
			make.center.equalToSuperview()
		}
		
		
		
		self.model = RAYHomeModel()
		self.model?.a = "test Demo"
		
		print(self.model?.description)
    }

	
	
	

}
