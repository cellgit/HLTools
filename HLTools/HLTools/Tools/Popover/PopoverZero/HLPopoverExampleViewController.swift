//
//  HLPopoverExampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/9.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLPopoverExampleViewController: UIViewController {
    var dataList = [HLPopoverDataStruct]()   // popover是否弹出
    var isShowPopover = false   // popover是否弹出
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        navigationSettings()
    }
    
    func navigationSettings() {
        let rightButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        rightButton.setImage(UIImage.init(named: "M_care"), for: .normal)
        rightButton.action { (sender) in
            self.popoverAction(sender: sender)
        }
        let rightItem = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }
}

extension HLPopoverExampleViewController {
    
    ///Mark:add data of yourself
    func data() {
        let KIdentifierPopover = "IdentifierPopover"
        let KIdentifierSimpleLife = "IdentifierSimpleLife"
        let KIdentifierSwift = "IdentifierSwifte"
        let KIdentifierGoogle = "IdentifierGoogle"
        let KIdentifierApple = "IdentifierApple"
        
        
        // 传递数据
        let dict = ["Id":"id",
                    "status":"status"]
        let data0 = HLPopoverDataStruct.init(title: "Popover", identifier: KIdentifierPopover, dict: dict)
        let data1 = HLPopoverDataStruct.init(title: "Simple Life", identifier: KIdentifierSimpleLife, dict: dict)
        let data2 = HLPopoverDataStruct.init(title: "Swift", identifier: KIdentifierSwift, dict: dict)
        let data3 = HLPopoverDataStruct.init(title: "Google", identifier: KIdentifierGoogle, dict: dict)
        let data4 = HLPopoverDataStruct.init(title: "Apple", identifier: KIdentifierApple, dict: dict)
        self.dataList = [data0,
                    data1,
                    data2,
                    data3,
                    data4]
    }
}


///popover弹框
extension HLPopoverExampleViewController: HLPopoverCallbackDelegate,UIPopoverPresentationControllerDelegate {
    
    func popoverAction(sender: UIButton) {
        if isShowPopover==false {
            
            data()
            
            let params = HLPopoverStruct.init(dataList: dataList, identifier: "KMyStudyCourseDetailViewController", tableSize: CGSize(width: 150, height: 50 * self.dataList.count))
            let contentController = HLPopoverController.init(param: params)
            contentController.modalPresentationStyle = .popover
            contentController.preferredContentSize = CGSize(width: 150, height: 50 * self.dataList.count)
            contentController.delegate = self
            contentController.backgroundColor = UIColor.init(red: 240.0/255.0, green: 241.0/255.0, blue: 242.0/255.0, alpha: 1.0)
            contentController.view.backgroundColor = ThemeColor
            let popVC:UIPopoverPresentationController = contentController.popoverPresentationController!
            popVC.delegate = self
            popVC.backgroundColor = UIColor.init(red: 240.0/255.0, green: 241.0/255.0, blue: 242.0/255.0, alpha: 1.0)
            popVC.permittedArrowDirections = UIPopoverArrowDirection.up
            sender.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            popVC.sourceRect = CGRect(x: 12, y: 20, width: 10, height: 10)  // 设置锚点的 Rect
            popVC.sourceView = sender   // 设置锚点,可换成其它的视图
            self.present(contentController, animated: true, completion: nil)
        }
        else {
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    //代理回调
    func callbackAction(data: HLPopoverDataStruct) {
        print("callback data== \(data)")
        if data.dict["courseState"] == "1" {
            print("callback data== \(data.dict["courseState"] == "1")")
        }
        else {
            //TODO:操作
        }
        
    }
    
}

