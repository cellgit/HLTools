//
//  SWPopUpsContainerViewController.swift
//  CampusSafety
//
//  Created by liuhongli on 2018/3/30.
//  Copyright © 2018年 CampusSafety. All rights reserved.
//

import UIKit

enum SWPopUpsStyle {
    case normal
    case success
    case failed
}


class SWPopUpsContainerViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    func closeButton() -> UIButton {
        let button = UIButton.init(type: .custom)
        let width:CGFloat = 50
        let height:CGFloat = 50
        button.frame = CGRect(x: containerView.bounds.size.width - width, y: 0, width: width, height: height)
        button.setTitle("关闭", for: .normal)
        button.addTarget(self, action: #selector(evt_close_action), for: .touchUpInside)
        return button
    }
    func setupUI() {
        containerView.addSubview(closeButton())
    }
    @objc func evt_close_action() {
        self.dismiss(animated: true, completion: nil)
    }

}
