//
//  SecondComponentUtils.swift
//  ZQSecondComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import ZQUIKit
@objc class SecondComponentUtils: NSObject {
    @objc func secondMainVC(params: [String: Any]?) -> UIViewController? {
        let vc = SecondViewController()
        if let title = params?["title"] as? String {
            vc.title = title
        }
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage.zq_image(name: "btn_live_normal", bundleClass: self.classForCoder)
        nav.tabBarItem.selectedImage = UIImage.zq_image(name: "btn_live_selected", bundleClass: self.classForCoder)
        nav.tabBarItem.title = "Live"
        return nav
    }
}
