//
//  HLFlowLayoutViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/19.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLFlowLayoutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "流水标签按钮"
        flowLayoutViewSettings()
//        getClosureExample()
//        addOneButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/// MARK: 流水标签按钮
extension HLFlowLayoutViewController {
    func flowLayoutViewSettings() {
        let flowView = HLFlowLayoutView.init(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.size.width, height: 0))
        flowView.titles = ["爱在西元前","烟雨江南","大城小爱","隐形的翅膀","签","标签button","这个标签很长很长","标签","标签是按钮","标签不是Label","公元2018年5月20号","2018-05-20"]    // 设置按钮的标题
        flowView.contentInset = UIEdgeInsetsMake(10, 20, 10, 20)    // 设置按钮的上左下右缩进
        flowView.itemBackgroundColor = UIColor.white
        flowView.itemTitleColor = UIColor.darkGray
        flowView.itemSpacingX = 8
        flowView.itemSpacingY = 8
        flowView.itemHeight = 30
        flowView.itemCornerRadius = 15
        flowView.itemFont = UIFont.systemFont(ofSize: 14)
        flowView.itemOffsetX = 20
        flowView.itemBorderWidth = 0.5
        flowView.itemBorderColor = UIColor.init(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0).cgColor
        
        let showLabel = UILabel.hl_showLabel(containerView: self.view, offsetY: -150)
        flowView.callbackBlock { (sender) in
            print("senderTag===1=====\(sender.tag)")
            showLabel.text = "Tag\(sender.tag): \(sender.titleLabel?.text ?? "")"
        }
        self.view.addSubview(flowView)
        print("flowView.bounds.size.height==== \(flowView.frame.size.height)")
        flowView.backgroundColor = .cyan
    }
}




/// MARK: 按钮闭包回调, HLClosureButton
extension HLFlowLayoutViewController {
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
extension HLFlowLayoutViewController {
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




