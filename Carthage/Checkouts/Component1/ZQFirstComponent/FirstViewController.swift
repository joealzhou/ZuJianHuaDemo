//
//  FirstViewController.swift
//  ZQFirstComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var titleString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleString
        view.backgroundColor = UIColor.gray
        
        let presentBtn = UIButton(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        presentBtn.setTitleColor(UIColor.white, for: .normal)
        presentBtn.setTitle("present vc", for: .normal)
        presentBtn.addTarget(self, action: #selector(presentBtnClick), for: .touchUpInside)
        view.addSubview(presentBtn)
    }
    
    @objc fileprivate func presentBtnClick() {
        guard let routeUrl = "ZQRouteOne://present/ZQSecondComponent.OrangeViewController".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
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
