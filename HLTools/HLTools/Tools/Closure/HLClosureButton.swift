//
//  HLClosureButton.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/19.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

var buttonBackKey = "buttonBackKey"

//class HLClosureButton: UIButton {}

extension UIButton {
    var buttonBack: buttonBlock? {
        set {
            objc_setAssociatedObject(self, &buttonBackKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &buttonBackKey) as? buttonBlock
        }
    }
    open func action(_ block: @escaping ((_ self: UIButton) -> ())) {
        self.addTarget(self, action: #selector(evt_btn_action(sender:)), for: .touchUpInside)
        self.buttonBack = block
    }
    @objc private func evt_btn_action(sender: UIButton) {
        guard let call = buttonBack else { return }
        call(sender)
    }
}


