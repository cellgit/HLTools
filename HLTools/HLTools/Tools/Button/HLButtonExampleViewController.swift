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
        button.imagePosition = HLButtonImagePosition.left
        button.adjustsTitleTintColorAutomatically = true
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        button.center = self.view.center
        button.bounds.size = CGSize(width: 200, height: 50)
        self.view.addSubview(button)
        button.setTitleColor(UIColor.red, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0.5
        button.layer.borderColor = ThemeColor.cgColor
    }
    

}
