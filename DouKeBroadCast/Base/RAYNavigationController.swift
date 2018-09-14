//
//  RAYNavigationController.swift
//  DouKeBroadCast
//
//  Created by fumi on 2018/9/14.
//  Copyright © 2018年 fumi. All rights reserved.
//

import Foundation
class RAYNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // only the first one show the bottomBar
        if self.viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true;
            self.viewControllers.first?.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }
}
