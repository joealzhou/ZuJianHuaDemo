//
//  ZQSecondComponentMediator.swift
//  ZQSecondComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import ZQMediator
fileprivate let ZQComponentName = "ZQSecondComponent"
fileprivate let ZQTargetName = "SecondComponentUtils"
fileprivate let ZQActionName = "secondMainVCWithParams:"
extension ZQMediator {
    public func mediatorSecondComponentMainVC() -> UIViewController? {
        let result = perform(nameSpace: ZQComponentName, target: ZQTargetName, action: ZQActionName, params: ["title" : "secondVC"])
        return result as? UIViewController
    }
}
