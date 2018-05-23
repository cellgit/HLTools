//
//  HLGridViewExampleVC.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/23.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLGridViewExampleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        var buttons = [UIButton]()
        for i in 0 ..< 20 {
            let button = UIButton.init(type: .custom)
            button.tag = i
            buttons.append(button)
        }
        let screenWidth = UIScreen.main.bounds.size.width
        let gridView = HLGridView.init(frame: .zero, views: buttons)
        gridView.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 0)
        gridView.subviewHeight = 20
        self.view.addSubview(gridView)
    }
}
