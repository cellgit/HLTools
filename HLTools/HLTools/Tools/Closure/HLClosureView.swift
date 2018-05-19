//
//  HLClosureView.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/19.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

typealias buttonBlock = (_ sender: UIButton) -> Void

class HLClosureView: UIView {
    var callback: buttonBlock?
    open func callbackBlock(_ block: @escaping ((_ sender: UIButton) -> ())) {
        self.callback = block
    }
    @objc private func evt_btn_action(sender: UIButton) {
        guard let call = callback else { return }
        call(sender)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        let button = UIButton.init(type: .custom)
        self.addSubview(button)
        button.center = self.center
        button.bounds.size = CGSize(width: 200, height: 60)
        button.setTitle("闭包回调按钮", for: .normal)
        button.tag = 1000
        button.addTarget(self, action: #selector(evt_btn_action(sender:)), for: .touchUpInside)
    }
}







