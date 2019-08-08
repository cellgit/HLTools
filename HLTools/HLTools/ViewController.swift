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
    let KSKPhotoBrowserIdentifier = "SKPhotoBrowserIdentifier"
    let KTicketManagerIdentifier = "TicketManagerIdentifier"
    let KImagePickerIdentifier = "ImagePickerIdentifier"
    let KDocumentsIdentifier = "DocumentsIdentifier"
    let KCoreMLIdentifier = "CoreMLIdentifier"
    let KGradientTextIdentifier = "GradientTextIdentifier"
    
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
        let data12 = HLTableViewDataStruct.init(title: "SKPhotoBrowser", identifier: KSKPhotoBrowserIdentifier)
        let data13 = HLTableViewDataStruct.init(title: "票券管理器", identifier: KTicketManagerIdentifier)
        let data14 = HLTableViewDataStruct.init(title: "图片视频选择器", identifier: KImagePickerIdentifier)
        let data15 = HLTableViewDataStruct.init(title: "访问Documents目录", identifier: KDocumentsIdentifier)
        let data16 = HLTableViewDataStruct.init(title: "CoreMLIdentifier:机器学习", identifier: KCoreMLIdentifier)
        let data17 = HLTableViewDataStruct.init(title: "渐变字体", identifier: KGradientTextIdentifier)
        
        
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
                              data11,
                              data12,
                              data13,
                              data14,
                              data15,
                              data16,
                              data17]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "小控件"
        tableViewData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = UIViewController.init()
        switch tableviewDataArray[indexPath.row].identifier {
        case KProgressIdentifier:
            vc = HLProgressBarListViewController.init()
        case KCalandarIdentifier:
            vc = HLCalendarListViewController.init()
        case KPresentIdentifier:
            vc = HLPopUpsContainerListViewController.init()
        case KPopoverIdentifier:
            vc = HLPopoverListViewController.init()
        case KVideoIdentifier:
            vc = HLPlayerListViewController.init()
        case KFlowLayoutViewIdentifier:
            vc = HLFlowLayoutButtonListViewController.init()
        case KGridViewIdentifier:
            vc = HLGridViewListViewController.init()
        case KCutStringIdentifier:
            vc = HLStringListViewController.init()
        case KButtonIdentifier:
            vc = HLButtonListViewController.init()
        case KStarViewIdentifier:
            vc = HLScoreMarkListViewController.init()
        case KClosureIdentifier:
            vc = HLClosureListViewController.init()
        case KSKPhotoBrowserIdentifier:
            vc = HLSKPhotoBrowserViewController.init()
        case KTicketManagerIdentifier:
            vc = HLTicketMangerViewController.init()
        case KImagePickerIdentifier:
            vc = HLImagePickerViewController.init()
        case KDocumentsIdentifier:
            vc = HLDocumentsExampleViewController.init()
        case KCoreMLIdentifier:
            vc = HLCoreMLListViewController.init()
        case KGradientTextIdentifier:
            vc = HLGradientListViewController.init()
            
        default:
            vc = HLProgressBarListViewController.init()
        }
        pushViewController(vc: vc, animated: true)
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



