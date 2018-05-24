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
        self.title = "GridViewController"
        self.view.backgroundColor = .white
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        var buttons = [UIButton]()
        for i in 0 ..< 8 {
            let button = UIButton.init(type: .custom)
            button.tag = i
            buttons.append(button)
            buttons[i].addTarget(self, action: #selector(evt_click_action(sender:)), for: .touchUpInside)
        }
        
        let gridView = HLGridView.init(frame: .zero)
        gridView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 0)
        gridView.gridHeight = 96
        gridView.column = 3
        gridView.views = buttons
        gridView.separatorWidth = 0.34
        gridView.gridViewColor = UIColor.white
        self.view.addSubview(gridView)
    }
    
    
    @objc func evt_click_action(sender: UIButton) {
        print("====tag==== \(sender.tag)")
        // 如果是在 cell 中布局需要先计算总高度,设置cell的高度,并且为cell设置identifier,点击时传递sender和identifier
        // delegate?.sw_wealth_button_action(sender: sender, identifier: self.identifier)
        
        //在一般的view中使用
        self.navigationController?.pushViewController(HLGridViewPushExampleVC(), animated: true)
        
        
    }
}

class HLGridViewPushExampleVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GridView跳转"
        
        self.view.backgroundColor = .white
        
    }
    
    
}




