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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/// MARK: 流水标签按钮
extension HLFlowLayoutViewController {
    func flowLayoutViewSettings() {
        let currentTime: String = HLTimerManager.shared.getCurrentTime(dateFormat: HLDateFormat.YearToDay)
        let timCurrentTime: String = HLTimerManager.shared.getCurrentTime(dateFormat: HLDateFormat.TimYearToDay)
        let flowView = HLFlowLayoutView.init(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.size.width, height: 0))
        flowView.titles = ["爱在西元前","烟雨江南","大城小爱","隐形的翅膀","在那东山顶上","2002年的第一场雪到\(currentTime)多少年了","Swift写了停不下来","海棠秀--我心不忘","千万次地问","北京人在纽约","今天是\(timCurrentTime)","雾里看花"]    // 设置按钮的标题
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
