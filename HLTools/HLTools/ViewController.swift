//
//  ViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/25.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

struct HomeDataStruct {
    var title = ""
    var identifier = ""
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,SWCalendarDelegate {
    
    let cellId:String = "cellId"
    var tableView:UITableView!
    var homeDataArray = [HomeDataStruct]()
    
    func getHomeData() {
        let data1 = HomeDataStruct.init(title: "进度君", identifier: "progressIdentifier")
        let data2 = HomeDataStruct.init(title: "日历君", identifier: "calandarIdentifier")
        let data3 = HomeDataStruct.init(title: "弹框君", identifier: "presentIdentifier")
        let data4 = HomeDataStruct.init(title: "Popover君", identifier: "popoverIdentifier")
        let data5 = HomeDataStruct.init(title: "视频君", identifier: "videoIdentifier")
        let data6 = HomeDataStruct.init(title: "流水布局按钮", identifier: "flowLayoutViewIdentifier")
        let data7 = HomeDataStruct.init(title: "GridView", identifier: "gridViewIdentifier")
        let data8 = HomeDataStruct.init(title: "字符串截取", identifier: "cutStringIdentifier")
        let data9 = HomeDataStruct.init(title: "按钮", identifier: "buttonIdentifier")
        let data10 = HomeDataStruct.init(title: "字符串转换", identifier: "stringExchangeIdentifier")
        
        
        homeDataArray = [data1,
                         data2,
                         data3,
                         data4,
                         data5,
                         data6,
                         data7,
                         data8,
                         data9,
                         data10]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getHomeData()
        configuration()
        setupTableView()
    }
    func configuration() {
        self.title = "小控件"
    }
    func setupTableView() {
        tableView = UITableView.init(frame: self.view.frame, style: .plain)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "row \(indexPath.row) : --  \(homeDataArray[indexPath.row].title)"
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (homeDataArray[indexPath.row].identifier .elementsEqual("progressIdentifier")) {
            let vc:HLProgressBarViewController = HLProgressBarViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("calandarIdentifier")) {
            let vc = UIStoryboard(name: "CalendarViewController", bundle: nil).instantiateViewController(withIdentifier: "KCalendarViewController") as UIViewController
            let viewController:CalendarViewController = vc as! CalendarViewController
            viewController.delegate = self
            self.present(viewController, animated: true, completion: nil)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("presentIdentifier")) {
            let vc = UIStoryboard(name: "SWPopUpsContainerViewController", bundle: nil).instantiateViewController(withIdentifier: "KSWPopUpsContainerViewController") as UIViewController
            // 这里如果有tabBarController,需要用:self.viewController.tabBarController.present(vc, animated: true, completion: nil), 否则遮不住tabBar
            self.present(vc, animated: true, completion: nil)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("popoverIdentifier")) {
            let vc = UIStoryboard(name: "HLPopoverViewController", bundle: nil).instantiateViewController(withIdentifier: "KHLPopoverViewController") as UIViewController
            self.pushViewController(vc: vc, animated: true)
        }
        else if homeDataArray[indexPath.row].identifier.elementsEqual("videoIdentifier") {
            let urlStr: String = "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"
            let params = HLPlayerStruct.init(url: urlStr)
            let vc = HLPlayerViewController.init(params: params)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("flowLayoutViewIdentifier")) {
            let vc:HLFlowLayoutViewController = HLFlowLayoutViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("gridViewIdentifier")) {
            let vc:HLGridViewExampleVC = HLGridViewExampleVC.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("cutStringIdentifier")) {
            let vc:HLStringExtensionExampleViewController = HLStringExtensionExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("buttonIdentifier")) {
            let vc:HLButtonExampleViewController = HLButtonExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (homeDataArray[indexPath.row].identifier .elementsEqual("stringExchangeIdentifier")) {
            let vc:HLButtonExampleViewController = HLButtonExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
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
    //MARK: SWCalendarDelegate 获取点击选择的日期
    func getSelectedDate(selectedDate: Date) {
        print("selectedDateString:\(selectedDate)")
    }
}

extension ViewController {
    func pushViewController(vc:UIViewController, animated:Bool) {
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

