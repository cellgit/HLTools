//
//  HLClosureButtonExampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/3.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLClosureButtonExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "闭包回调按钮"
        
        addOneButton()
//        getClosureExample()
    }
}

/// MARK: 按钮闭包回调, HLClosureButton
extension HLClosureButtonExampleViewController {
    func addOneButton() {
        let button = UIButton.init(type: .custom)
        self.view.addSubview(button)
        button.center = self.view.center
        button.bounds.size = CGSize(width: 200, height: 60)
        button.setTitle("按钮自身回调", for: .normal)
        button.tag = 10001
        button.backgroundColor = .lightGray
        
        let showLabel = UILabel.hl_showLabel(containerView: self.view, offsetY: -150)
        button.action { (sender) in
            print("sender.tag====== \(sender.tag)")
            showLabel.text = "Tag\(sender.tag): \(sender.titleLabel?.text ?? "")"
        }
    }
}
/// MARK: 闭包回调
extension HLClosureButtonExampleViewController {
    func getClosureExample() {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 550, width: UIScreen.main.bounds.size.width, height: 100))
        self.view.addSubview(containerView)
        self.closureCallBack(view: containerView)
    }
    func closureCallBack(view: UIView) {
        
        let closureView: HLClosureView = HLClosureView.init(frame: view.bounds)
        let showLabel = UILabel.hl_showLabel(containerView: self.view, offsetY: -150)
        closureView.callbackBlock { (sender) in
            print("button.tag====== \(sender.tag)")
            showLabel.text = "Tag\(sender.tag): \(sender.titleLabel?.text ?? "")"
        }
        closureView.backgroundColor = .cyan
        view.addSubview(closureView)
    }
}




