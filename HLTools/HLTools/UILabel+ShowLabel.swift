//
//  UILabel+ShowLabel.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import Foundation

import UIKit


extension UILabel {
    
    /// 显示文字的label, 起到辅助本项目作用
    ///
    /// - Parameters:
    ///   - containerView: label的容器视图
    ///   - offsetY: label在 Y 轴方向的偏移
    /// - Returns: label
    static func hl_showLabel(containerView: UIView, offsetY: CGFloat) -> UILabel {
        let label = UILabel.init()
        containerView.addSubview(label)
        label.text = "显示标签"
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp.centerY).offset(offsetY)
            make.centerX.equalTo(containerView)
            make.left.equalTo(containerView).offset(20)
            make.right.equalTo(containerView).offset(-20)
        }
        return label
    }
}


