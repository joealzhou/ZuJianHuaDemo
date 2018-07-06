//
//  BaseTabBarViewController.swift
//  zujianhuaDemo
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import ZQMediator
import ZQFirstComponent
import ZQSecondComponent
class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configChildViewControlelrs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension BaseTabBarViewController {
    fileprivate func configChildViewControlelrs() {
        self.tabBar.tintColor = UIColor.orange
        if let firstVC = ZQMediator.default.mediatorFirstComponentMainVC() {
            addChildViewController(firstVC)
        }
        if let secondVC = ZQMediator.default.mediatorSecondComponentMainVC() {
            addChildViewController(secondVC)
        }
        
    }
}
