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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Popover", style: .plain, target: self, action: #selector(evt_click_popover_action))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let popoverViewController = segue.destination
            popoverViewController.popoverPresentationController?.delegate = self
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
