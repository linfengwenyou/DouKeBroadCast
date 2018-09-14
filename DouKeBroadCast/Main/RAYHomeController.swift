//
//  RAYHomeController.swift
//  DouKeBroadCast
//
//  Created by fumi on 2018/9/14.
//  Copyright © 2018年 fumi. All rights reserved.
//

import Foundation
class RAYHomeController: RAYBaseViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.navigationController?.pushViewController(RAYBaseViewController(), animated: true)
    }
}
