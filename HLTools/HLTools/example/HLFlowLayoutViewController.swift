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
        
        setupUI()
        getClosureExample()
        addOneButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupUI() {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 200))
        self.view.addSubview(containerView)
        containerView.backgroundColor = .cyan
        let flowView: FlowButtonView = FlowButtonView.init(frame: containerView.bounds, viewHeight: containerView.bounds.size.height, titleLabelText: "123aghlhdahajd", btnTexts: ["123kashkhbk", "4havb56", "4havb56", "78vajsjklavgighuhuhulhulj9"]) { (button) in
            //
            print("button.tag ======= \(button.tag)")
            
        }
        flowView.backgroundColor = .cyan
        
        containerView.addSubview(flowView)
        
        
    }
    
    
    func getflowLayoutViewClass() {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 400, width: UIScreen.main.bounds.size.width, height: 100))
        self.view.addSubview(containerView)
        let flowView: HLFlowLayoutView = HLFlowLayoutView.init(frame: containerView.bounds)
        flowView.callbackBlock { (button) in
        }
        flowView.backgroundColor = .cyan
        containerView.addSubview(flowView)
    }
    func getClosureExample() {
        let containerView = UIView.init(frame: CGRect(x: 0, y: 550, width: UIScreen.main.bounds.size.width, height: 100))
        self.view.addSubview(containerView)
        self.closureCallBack(view: containerView)
    }
    func closureCallBack(view: UIView) {
        let closureView: HLClosureView = HLClosureView.init(frame: view.bounds)
        closureView.callbackBlock { (sender) in
            print("button.tag====== \(sender.tag)")
        }
        closureView.backgroundColor = .cyan
        view.addSubview(closureView)
    }
    
    func addOneButton() {
        let button = UIButton.init(type: .custom)
        self.view.addSubview(button)
        button.center = self.view.center
        button.bounds.size = CGSize(width: 200, height: 60)
        button.setTitle("按钮自身回调", for: .normal)
        button.tag = 10001
        button.backgroundColor = .lightGray
        button.action { (sender) in
            print("sender.tag====== \(sender.tag)")
        }
    }
    
    
    
    
}
