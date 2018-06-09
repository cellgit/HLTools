//
//  HLPopoverViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/4/1.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLPopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var PopoverButton: UIButton!
    
    open var popoverSourceRect:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Popover", style: .plain, target: self, action: #selector(evt_click_popover_action))
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let popoverViewController = segue.destination
            PopoverButton.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            popoverViewController.popoverPresentationController?.delegate = self
            let popVC:UIPopoverPresentationController = popoverViewController.popoverPresentationController!;
            popVC.delegate = self;
            popVC.permittedArrowDirections = UIPopoverArrowDirection.up
            PopoverButton.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            popoverSourceRect = CGRect(x: 20, y: 20, width: 10, height: 10)
            popVC.sourceRect = popoverSourceRect
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    
    @IBAction func PopoverAction(_ sender: Any) {
    }
    
//    @objc func evt_click_popover_action() {
//
//    }
    
}
