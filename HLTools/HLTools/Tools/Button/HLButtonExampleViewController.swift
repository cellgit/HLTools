//
//  HLButtonExampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/29.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLButtonExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func setupUI() {
        let button = HLButton(title: "红色代表爱", image: UIImage.init(named: "M_care"))
        button.frame = CGRect(x: ScreenWidth/2 - 50, y: 200, width: 200, height: 38)
        self.view.addSubview(button)
        button.adjustsTitleTintColorAutomatically = true
        button.imagePosition = HLButtonImagePosition.left
        button.setTitleColor(UIColor.red, for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
    }
    

}
