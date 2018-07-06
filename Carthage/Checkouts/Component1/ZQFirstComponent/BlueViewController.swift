//
//  BlueViewController.swift
//  ZQFirstComponent
//
//  Created by 周强 on 2018/7/4.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit
 class BlueViewController: UIViewController {
    @objc fileprivate var detail: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        let detailL = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        detailL.text = detail
        detailL.textColor = UIColor.orange
        detailL.numberOfLines = 0
        view.addSubview(detailL)
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
