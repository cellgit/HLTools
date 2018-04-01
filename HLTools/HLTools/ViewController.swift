//
//  ViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/25.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,SWCalendarDelegate {
    
    
    
    let cellId:String = "cellId"
    var tableView:UITableView!
    var dataArray:Array = ["进度君",
                           "日历君",
                           "弹框君",
                           "Popover君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "警示君",
                           "待续... ..."]
    
    let shapelayer = CAShapeLayer()
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "row \(indexPath.row) : --  \(dataArray[indexPath.row])"
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (dataArray[indexPath.row] .elementsEqual("进度君")) {
            let vc:HLProgressBarViewController = HLProgressBarViewController.init()
            pushViewController(vc: vc, animated: true)
        }
        else if (dataArray[indexPath.row] .elementsEqual("日历君")) {
            let vc = UIStoryboard(name: "CalendarViewController", bundle: nil).instantiateViewController(withIdentifier: "KCalendarViewController") as UIViewController
            let viewController:CalendarViewController = vc as! CalendarViewController
            viewController.delegate = self as? SWCalendarDelegate
            self.present(viewController, animated: true, completion: nil)
        }
        else if (dataArray[indexPath.row] .elementsEqual("弹框君")) {
            let vc = UIStoryboard(name: "SWPopUpsContainerViewController", bundle: nil).instantiateViewController(withIdentifier: "KSWPopUpsContainerViewController") as UIViewController
            // 这里如果有tabBarController,需要用:self.viewController.tabBarController.present(vc, animated: true, completion: nil), 否则遮不住tabBar
            self.present(vc, animated: true, completion: nil)
        }
        else if (dataArray[indexPath.row] .elementsEqual("Popover君")) {
            let vc = UIStoryboard(name: "HLPopoverViewController", bundle: nil).instantiateViewController(withIdentifier: "KHLPopoverViewController") as UIViewController
            self.pushViewController(vc: vc, animated: true)
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

