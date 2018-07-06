//
//  ZQFirstComponentMediator.swift
//  ZQFirstComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import ZQMediator

fileprivate let ZQComponentName = "ZQFirstComponent"
fileprivate let ZQTargetName = "FirstComponentUtils"
fileprivate let ZQActionName = "firstComponentMainVCWithParams:"
extension ZQMediator {
    
    /// 第一个组件的主导航控制器
    public func mediatorFirstComponentMainVC() -> UIViewController? {
        let result = ZQMediator.default.perform(nameSpace: ZQComponentName, target: ZQTargetName, action: ZQActionName, params: ["title":"Home"], shouldCacheTarget: false)
        return result as? UIViewController
    }
}
