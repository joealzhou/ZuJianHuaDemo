//
//  OrangeViewController.swift
//  ZQSecondComponent
//
//  Created by 周强 on 2018/7/5.
//  Copyright © 2018年 周强. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        let closeBtn = UIButton(frame: CGRect(x: 50, y: 50, width: 60, height: 30))
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.white, for: .normal)
        closeBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        view.addSubview(closeBtn)
        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func closeBtnClick() {
        self.dismiss(animated: true , completion: nil)
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
