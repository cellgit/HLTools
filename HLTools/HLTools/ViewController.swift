//
//  ViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/25.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class ViewController: HLBaseViewController {
    let KProgressIdentifier = "ProgressIdentifier"
    let KCalandarIdentifier = "CalandarIdentifier"
    let KPresentIdentifier = "PresentIdentifier"
    let KPopoverIdentifier = "PopoverIdentifier"
    let KVideoIdentifier = "VideoIdentifier"
    let KFlowLayoutViewIdentifier = "FlowLayoutViewIdentifier"
    let KGridViewIdentifier = "GridViewIdentifier"
    let KCutStringIdentifier = "CutStringIdentifier"
    let KButtonIdentifier = "ButtonIdentifier"
    let KStarViewIdentifier = "StarViewIdentifier"
    let KClosureIdentifier = "ClosureIdentifier"
    
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "进度", identifier: KProgressIdentifier)
        let data2 = HLTableViewDataStruct.init(title: "日历", identifier: KCalandarIdentifier)
        let data3 = HLTableViewDataStruct.init(title: "弹框", identifier: KPresentIdentifier)
        let data4 = HLTableViewDataStruct.init(title: "Popover", identifier: KPopoverIdentifier)
        let data5 = HLTableViewDataStruct.init(title: "视频", identifier: KVideoIdentifier)
        let data6 = HLTableViewDataStruct.init(title: "流水布局按钮", identifier: KFlowLayoutViewIdentifier)
        let data7 = HLTableViewDataStruct.init(title: "GridView", identifier: KGridViewIdentifier)
        let data8 = HLTableViewDataStruct.init(title: "字符串截取", identifier: KCutStringIdentifier)
        let data9 = HLTableViewDataStruct.init(title: "按钮", identifier: KButtonIdentifier)
        let data10 = HLTableViewDataStruct.init(title: "星星评分视图", identifier: KStarViewIdentifier)
        let data11 = HLTableViewDataStruct.init(title: "闭包", identifier: KClosureIdentifier)
        
        tableviewDataArray = [data1,
                              data2,
                              data3,
                              data4,
                              data5,
                              data6,
                              data7,
                              data8,
                              data9,
                              data10,
                              data11]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "小控件"
        tableViewData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KProgressIdentifier)) {
            let vc = HLProgressBarListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KCalandarIdentifier)) {
            let vc = HLCalendarListViewController()
            self.pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPresentIdentifier)) {
            let vc = HLPopUpsContainerListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPopoverIdentifier)) {
            let vc = HLPopoverListViewController.init()
            self.pushViewController(vc: vc, animated: true)
        }
        else if tableviewDataArray[indexPath.row].identifier.elementsEqual(KVideoIdentifier) {
            let vc = HLPlayerListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFlowLayoutViewIdentifier)) {
            let vc = HLFlowLayoutButtonListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KGridViewIdentifier)) {
            let vc = HLGridViewListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KCutStringIdentifier)) {
            let vc = HLStringListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KButtonIdentifier)) {
            let vc = HLButtonListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KStarViewIdentifier)) {
            let vc = HLScoreMarkListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KClosureIdentifier)) {
            let vc = HLClosureListViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
    // 在这里设置tableViewCell的动画
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // initial state of cell
        cell.alpha = 0.0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -300, 20, 10)
        cell.layer.transform = transform
        // change the final state of cell by UIView animation
        UIView.animate(withDuration: 0.33) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}



