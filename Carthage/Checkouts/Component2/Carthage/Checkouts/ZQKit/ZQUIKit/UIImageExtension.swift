//
//  UIImageExtension.swift
//  ZQUIKit
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit

extension UIImage {
    public static func zq_image(name: String, bundleClass: AnyClass?, bundleFile: String? = nil) -> UIImage? {
        var image: UIImage?
        
        let bundle = bundleClass == nil ? Bundle.main : Bundle(for: bundleClass!)
        
        image = self.init(named: name, in: bundle, compatibleWith: nil)
        
        if image == nil, let path = bundle.path(forResource: bundleFile, ofType: "bundle") {
            image = self.init(named: name, in: Bundle.init(path: path), compatibleWith: nil)
        }
        
        return image
    }
}
