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
    
    private var callback: buttonBlock?
    open func callbackBlock(_ block: @escaping buttonBlock) {
        callback = block
    }
    private func evt_btn_action(sender: UIButton) {
        guard let call = callback else { return }
        call(sender)
    }
    
    override init(frame: CGRect) {
        self.init()
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }

}



class FlowButtonView: UIView {
    static let shared = FlowButtonView()
    //标题
    private let titleLabel = UILabel()
    //上一个按钮的maxX加上间距
    private var lastX: CGFloat = 0
    //上一个按钮的y值
    private var lastY: CGFloat = 35
    //按钮的回调block
    private var btnCallBackBlock: ((_ btn: UIButton) -> ())?
    //SearchView的总高度
    var searchViewHeight: CGFloat = 0
    //是否有初始高度
    var initialViewHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width - 30, height: 35)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.darkGray
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect,viewHeight:CGFloat, titleLabelText: String, btnTexts: [String], btnCallBackBlock: @escaping ((_ sender: UIButton) -> ())) {
        self.init(frame: frame)
        self.initialViewHeight = viewHeight
        titleLabel.text = titleLabelText
        //按钮文字的宽度
        var btnW: CGFloat = 0
        //按钮的高度
        let btnH: CGFloat = 30
        //文字与按钮两边的距离之和
        let addW: CGFloat = 30
        //横向间距
        let marginX: CGFloat = 10
        //纵向间距
        let marginY: CGFloat = 10
        
        for i in 0..<btnTexts.count {
            let btn = UIButton(type: .custom)
            btn.setTitle(btnTexts[i], for: .normal)
            btn.setTitleColor(UIColor.darkGray, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleLabel?.sizeToFit()
            btn.backgroundColor = .lightGray
            btn.layer.cornerRadius = 3
            btn.layer.masksToBounds = true
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
            //按钮的总宽度
            btnW = (btn.titleLabel?.bounds.width)! + addW
            
            btn.tag = i
            
            //在给按钮的frame赋值之前先判断本行余下的宽度是否大于将要布局的按钮的宽度,如果大于则x值为上一个按钮的宽度加上横向间距,y值与上一个按钮相同,如果小于则x值为0,y值为上一个按钮的y值加上按钮的高度和纵向间距
            if frame.width - lastX > btnW {
                btn.frame = CGRect(x: lastX, y: lastY, width: btnW, height: btnH)
            } else {
                btn.frame = CGRect(x: 0, y: lastY + marginY + btnH, width: btnW, height: btnH)
            }
            lastX = btn.frame.maxX + marginX
            lastY = btn.frame.origin.y
            if initialViewHeight != 0{
                if lastY >= initialViewHeight{
                    break
                }
            }
            searchViewHeight = btn.frame.maxY
            addSubview(btn)
        }
        self.btnCallBackBlock = btnCallBackBlock
    }
    
    @objc private func btnClick(sender: UIButton) {
        btnCallBackBlock!(sender)
    }
}



