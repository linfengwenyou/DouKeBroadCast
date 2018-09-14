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
    }


}
