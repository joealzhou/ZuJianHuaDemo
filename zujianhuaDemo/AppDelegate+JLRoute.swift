//
//  AppDelegate+JLRoute.swift
//  JLRouteDemo
//
//  Created by 周强 on 2018/6/28.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
import JLRoutes
extension AppDelegate {
    
    /// 以push方式推出下一个页面
    func registerPushRouteWithScheme(scheme: String) {
        JLRoutes(forScheme: scheme).addRoute("/push/:controller") {
            [weak self] (dic: [String: Any]) -> Bool in
            guard let clsString = dic["controller"] as? String else {
                debugPrint("not found controller string")
                return true
            }
            //在swift中clsString = AppProjectName.ClassName example:zujianhuaDemo.ViewController
            guard let cls = NSClassFromString(clsString) else {
                debugPrint("not found vc class: \(clsString)")
                return true
            }
            if cls is UIViewController.Type {
                let nextVC = (cls as! UIViewController.Type).init()
                self?.paramToVC(vc: nextVC, parameters: dic )
                
                let currentVC = self?.currentViewController()
                currentVC?.navigationController?.pushViewController(nextVC, animated: true)
            }
            return true
        }
    }
    
    /// 以present方式推出下一个页面
    func registerPresentRouteWithScheme(scheme: String) {
        JLRoutes(forScheme: scheme).addRoute("/present/:controller") {
            [weak self] (dic: [String: Any]) -> Bool in
            guard let clsString = dic["controller"] as? String else {
                debugPrint("not found controller string")
                return true
            }
            //在swift中clsString = AppProjectName.ClassName example:zujianhuaDemo.ViewController
            guard let cls = NSClassFromString(clsString) else {
                debugPrint("not found vc class: \(clsString)")
                return true
            }
            if cls is UIViewController.Type {
                let nextVC = (cls as! UIViewController.Type).init()
                self?.paramToVC(vc: nextVC, parameters: dic )
                
                let currentVC = self?.currentViewController()
                currentVC?.present(nextVC, animated: true , completion: nil)
            }
            return true
        }
    }
    
    func currentViewController() -> UIViewController? {
        guard let rootVC = window?.rootViewController else { return nil }
        if let rootVC = rootVC as? UITabBarController {
            if let navVC = rootVC.viewControllers?[rootVC.selectedIndex] as? UINavigationController {
                return navVC.topViewController
            } else  {
                return rootVC
            }
        } else if let navVC = rootVC as? UINavigationController {
            return navVC.topViewController
        }
        return rootVC
    }
    
    /// 传参数
    ///
    /// - Parameters:
    ///   - vc: 下一个界面
    ///   - parameters: 传递的参数
    func paramToVC(vc: UIViewController, parameters: [String: Any]) {
        
//        var outCount: UInt32 = 0
//        let properties = class_copyPropertyList(vc.classForCoder, &outCount)
//        for i in 0..<outCount {
//            let property = properties![Int(i)]
//            let key = String(cString: property_getName(property))
//            if let param = parameters[key] as? String {
//                debugPrint("property: \(key):\(param)")
//                vc.setValue(param, forKey: key)
//            }
//        }
        //===================================================================
        var ivarCount: UInt32 = 0
        let ivarList = class_copyIvarList(vc.classForCoder, &ivarCount)
        for i in 0..<ivarCount {
            let ivar = ivarList![Int(i)]
            let key = String(cString: ivar_getName(ivar)!)
            if let param = parameters[key] as? String {
                debugPrint("ivar: \(key):\(param)")
                vc.setValue(param, forKey: key)
            }
        }
        
    }
}

extension AppDelegate {
    /// 在swift中使用NSClassFromString className要加工程名前缀
    ///
    /// - Parameter className: className
    /// - Returns:
    fileprivate func swiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            // YourProject.className
            let classStringName = appName + "." + className
            debugPrint(classStringName)
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}
