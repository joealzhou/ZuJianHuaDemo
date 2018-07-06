//
//  SecondViewController.swift
//  ZQSecondComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        let pushBtn = UIButton(frame: CGRect(x: 50, y: 200, width: 100, height: 20))
        pushBtn.setTitle("push VC", for: .normal)
        pushBtn.setTitleColor(UIColor.white, for: .normal)
        pushBtn.addTarget(self, action: #selector(pushBtnClick), for: .touchUpInside)
        view.addSubview(pushBtn)

    }
    
    @objc fileprivate func pushBtnClick() {
        guard let routeUrl = "ZQRouteOne://push/ZQFirstComponent.BlueViewController?detail=this detail text from other component".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: routeUrl) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
