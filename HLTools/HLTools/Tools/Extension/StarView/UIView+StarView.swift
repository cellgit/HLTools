//
//  UIView+StarView.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/30.
//  Copyright © 2018 lhl. All rights reserved.
//

//import Foundation
import UIKit
import SnapKit

/// 星星打分视图：
/// 用法： starContainerView.hl_starView(score: 4.6, starWidth: 11)
extension UIView {
    func hl_starView(score: CGFloat, starWidth: CGFloat) {
        for item in self.subviews {
            if item.isKind(of: UIImageView.self) {
                item.removeFromSuperview()
            }
        }
        /// padding的值要注意,可能会影响布局,如果影响布局直接写成一个固定值
        let padding: CGFloat = (self.bounds.size.width - starWidth * 5)/4
        var imgViewArray = [UIImageView]()
        for i in 0..<5 {
            let imgView = UIImageView.init(image: UIImage.init(named: "stars_2"))
            self.addSubview(imgView)
            imgView.tag = i
            imgViewArray.append(imgView)
            if i == 0 {
                imgView.translatesAutoresizingMaskIntoConstraints = false
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
            }
            else {
                imgView.translatesAutoresizingMaskIntoConstraints = false
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: imgViewArray[i-1], attribute: .right, multiplier: 1, constant: padding))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
            }
        }
        let scoreInt = Int(score)
        let scoreFloor = CGFloat(scoreInt)
        let diffValue = score - scoreFloor
        if diffValue == 0{
            // 没有半颗星
            let starCount = scoreInt
            for i in 0..<starCount {
                let imgView = UIImageView.init(image: UIImage.init(named: "stars_1"))
                self.addSubview(imgView)
                imgView.tag = i
                imgViewArray.append(imgView)
                if i == 0 {
                    imgView.translatesAutoresizingMaskIntoConstraints = false
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
                }
                else {
                    imgView.translatesAutoresizingMaskIntoConstraints = false
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: imgViewArray[i-1], attribute: .right, multiplier: 1, constant: padding))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
                }
            }
        }
        else if diffValue > 0 {
            // 有半颗星
            let starCount = scoreInt + 1
            for i in 0..<starCount {
                let imgView = UIImageView.init()
                if i < starCount-1 {
                    imgView.image = UIImage.init(named: "stars_1")
                }
                else {
                    imgView.image = UIImage.init(named: "stars_half")
                }
                self.addSubview(imgView)
                imgView.tag = i
                imgViewArray.append(imgView)
                if i == 0 {
                    imgView.translatesAutoresizingMaskIntoConstraints = false
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
                }
                else {
                    imgView.translatesAutoresizingMaskIntoConstraints = false
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .left, relatedBy: .equal, toItem: imgViewArray[i-1], attribute: .right, multiplier: 1, constant: padding))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: starWidth))
                    self.addConstraint(NSLayoutConstraint.init(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: starWidth))
                }
            }
        }
    }
}
