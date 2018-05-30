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
/// 用法： starContainerView.sw_starView(score: score)
extension UIView {
    func sw_starView(score: CGFloat, starWidth: CGFloat) {
        for item in self.subviews {
            if item.isKind(of: UIImageView.self) {
                item.removeFromSuperview()
            }
        }
        let padding: CGFloat = (self.bounds.size.width - starWidth * 5)/4
        var imgViewArray = [UIImageView]()
        for i in 0..<5 {
            let imgView = UIImageView.init(image: UIImage.init(named: "stars_2"))
            self.addSubview(imgView)
            imgView.tag = i
            imgViewArray.append(imgView)
            if i == 0 {
                imgView.snp.makeConstraints({ (make) in
                    make.left.equalTo(self.snp.left)
                    make.centerY.equalTo(self.snp.centerY)
                    make.width.height.equalTo(starWidth)
                })
            }
            else {
                imgView.snp.makeConstraints({ (make) in
                    make.left.equalTo(imgViewArray[i-1].snp.right).offset(padding)
                    make.centerY.equalTo(self.snp.centerY)
                    make.width.height.equalTo(starWidth)
                })
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
                    imgView.snp.makeConstraints({ (make) in
                        make.left.equalTo(self.snp.left)
                        make.centerY.equalTo(self.snp.centerY)
                        make.width.height.equalTo(starWidth)
                    })
                }
                else {
                    imgView.snp.makeConstraints({ (make) in
                        make.left.equalTo(imgViewArray[i-1].snp.right).offset(padding)
                        make.centerY.equalTo(self.snp.centerY)
                        make.width.height.equalTo(starWidth)
                    })
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
                    imgView.snp.makeConstraints({ (make) in
                        make.left.equalTo(self.snp.left)
                        make.centerY.equalTo(self.snp.centerY)
                        make.width.height.equalTo(starWidth)
                    })
                }
                else {
                    imgView.snp.makeConstraints({ (make) in
                        make.left.equalTo(imgViewArray[i-1].snp.right).offset(padding)
                        make.centerY.equalTo(self.snp.centerY)
                        make.width.height.equalTo(starWidth)
                    })
                }
            }
        }
    }
}
