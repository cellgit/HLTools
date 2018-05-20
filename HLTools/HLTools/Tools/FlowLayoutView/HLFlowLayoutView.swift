//
//  HLFlowLayoutView.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/19.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

//typealias buttonBlock = (_ sender: UIButton) -> ()

class HLFlowLayoutView: UIView {
    open var titles = [String]() {
        willSet {}
        didSet {
            if titles == titleList { return } else { titleList.removeAll() }
            for item in buttonList { item.removeFromSuperview() }
            layoutIfNeeded()
        }
    }
    open var contentInset = UIEdgeInsetsMake(0, 0, 0, 0) {  // 必须实现
        willSet {}
        didSet {
            if contentInset == UIEdgeInsetsMake(0, 0, 0, 0) || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemHeight: CGFloat = 30 {
        willSet {}
        didSet {
            if itemHeight == 30 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    /// button宽度的增补量:文字与button两边间距的和
    open var itemOffsetX: CGFloat = 16 {
        willSet {}
        didSet {
            if itemOffsetX == 16 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemSpacingX: CGFloat = 8 {
        willSet {}
        didSet {
            if itemSpacingX == 8 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemSpacingY: CGFloat = 8 {
        willSet {}
        didSet {
            if itemSpacingY == 8 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemCornerRadius: CGFloat = 0 {
        willSet {}
        didSet {
            if itemCornerRadius == 0 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemFont: UIFont = UIFont.systemFont(ofSize: 15) {
        willSet {}
        didSet {
            if itemFont == UIFont.systemFont(ofSize: 15) || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemBorderWidth: CGFloat = 0.0 {
        willSet {}
        didSet {
            if itemBorderWidth == 0.0 || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemBorderColor: CGColor = UIColor.white.cgColor {
        willSet {}
        didSet {
            if itemBorderColor == UIColor.white.cgColor || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemBackgroundColor: UIColor = UIColor.white {
        willSet {}
        didSet {
            if itemBackgroundColor == UIColor.white || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var itemTitleColor: UIColor = UIColor.darkGray {
        willSet {}
        didSet {
            if itemTitleColor == UIColor.darkGray || titles.isEmpty { return } else {
                for item in buttonList { item.removeFromSuperview() }
            }
            layoutIfNeeded()
        }
    }
    open var flowViewHeight: CGFloat = 0
    
    private var lastX: CGFloat = 0          //上一个按钮的maxX加上间距
    private var lastY: CGFloat = 0          //上一个按钮的y值
    private var buttonList = [UIButton]()
    private var titleList = [String]()
    private var callback: ((_ sender: UIButton) -> ())?      //按钮的回调block
    
    open func callbackBlock(_ block: @escaping ((_ sender: UIButton) -> ())) {
        callback = block
    }
    @objc private func evt_btn_action(sender: UIButton) {
        guard let call = callback else { return }
        call(sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {    //传递数据后重新布局子视图
        setupUI(titles: titles)
    }
    func setupUI(titles: [String]) {
        self.titleList = titles     //只做记录,然后和 titles 比较
        lastX = contentInset.left   //上一个按钮的maxX加上间距
        lastY = contentInset.top    //上一个按钮的y值
        var btnW: CGFloat = 0
        for i in 0..<titles.count {
            let btn = UIButton(type: .custom)
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(itemTitleColor, for: .normal)
            btn.titleLabel?.font = itemFont
            btn.titleLabel?.sizeToFit()
            btn.backgroundColor = itemBackgroundColor
            btn.layer.cornerRadius = itemCornerRadius
            btn.layer.masksToBounds = true
            btn.layer.borderWidth = itemBorderWidth
            btn.layer.borderColor = itemBorderColor
            btn.addTarget(self, action: #selector(evt_btn_action(sender:)), for: .touchUpInside)
            //按钮的总宽度
            btnW = (btn.titleLabel?.bounds.width)! + itemOffsetX
            btn.tag = i
            if self.frame.width - lastX - contentInset.right > btnW {
                btn.frame = CGRect(x: lastX, y: lastY, width: btnW, height: itemHeight)
            } else {
                btn.frame = CGRect(x: contentInset.left, y: lastY + itemSpacingY + itemHeight, width: btnW, height: itemHeight)
            }
            lastX = btn.frame.maxX + itemSpacingX
            lastY = btn.frame.origin.y
            self.frame.size.height = btn.frame.maxY + contentInset.bottom
            addSubview(btn)
            self.buttonList.append(btn)
            self.flowViewHeight = self.frame.size.height
        }
    }
}



