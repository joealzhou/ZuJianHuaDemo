//
//  FirstComponentUtils.swift
//  ZQFirstComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import ZQUIKit
@objc class FirstComponentUtils: NSObject {
    @objc func firstComponentMainVC(params: [String: Any]?) -> UIViewController? {
        let vc = FirstViewController()
        if let title = params?["title"] as? String {
            vc.titleString = title
        }
        let nav = UINavigationController(rootViewController: vc)
        if let normalImg = UIImage.zq_image(name: "btn_home_normal", bundleClass: self.classForCoder) {
            nav.tabBarItem.image = normalImg
            debugPrint("get img success")
        } else {
            debugPrint("get img failure")
        }
        
        nav.tabBarItem.selectedImage = UIImage.zq_image(name: "btn_home_selected", bundleClass: self.classForCoder)
        nav.tabBarItem.title = "First"
        return nav
    }
    
    @objc func blueViewController(params: [String: Any]?) -> BlueViewController {
        let vc = BlueViewController()
        return vc
    }
    
    
}
