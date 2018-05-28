//
//  HLStringExtensionExampleViewController.swift
//  HLTools
//
//  Created by liuhongli on 2018/5/28.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLStringExtensionExampleViewController: UIViewController {
    let str = "1234567654321"
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var lastBtn: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "字符串截取"
        self.view.backgroundColor = UIColor.white
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        let firstFourChar = str.subString(start: 0, length: 7)
        contentLabel.text = firstFourChar
    }
    @IBAction func lastAction(_ sender: UIButton) {
        let lastThreeChar = str.subString(start: str.count - 3, length: 3)
        contentLabel.text = lastThreeChar
    }
}
