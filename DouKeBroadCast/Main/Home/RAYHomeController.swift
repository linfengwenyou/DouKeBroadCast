//
//  RAYHomeController.swift
//  DouKeBroadCast
//
//  Created by fumi on 2018/9/14.
//  Copyright © 2018年 fumi. All rights reserved.
//

import Foundation


class RAYHomeController: RAYBaseViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
       super.viewDidLoad()
		
		self.tableView.register(UINib.init(nibName: stringOfClass(RAYHomeCell.self), bundle: nil), forCellReuseIdentifier:stringOfClass(RAYHomeCell.self))
		
    }
	

}


// 代理事件
extension RAYHomeController {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier:stringOfClass(RAYHomeCell.self)) as? RAYHomeCell
		cell?.titleLabel?.text = String(indexPath.row)
		return cell!
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return RAYHomeCell.cellHeight;
	}
}
