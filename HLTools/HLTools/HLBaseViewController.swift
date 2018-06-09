//
//  HLBaseViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/29.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLBaseViewController: UIViewController {
    
//    let KUIStoryboardCalandarIdentifier = "UIStoryboardCalandarIdentifier"
    
    let KUITableViewCell = "UITableViewCell"
    var tableView:UITableView!
    var tableviewDataArray = [HLTableViewDataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        tableViewData()
        setTableViewUI()
    }
    func tableViewData() {
        /// 子类在这里 添加 data 数据
//        let data1 = HLTableViewDataStruct.init(title: "UIStoryboardCalandar", identifier: KUIStoryboardCalandarIdentifier)
//        tableviewDataArray = [data1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTableViewUI() {
        tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        self.view.addSubview(tableView)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.contentInset = UIEdgeInsetsMake(NavigationH, 0, 0, 0)
        } else {}
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: KUITableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HLBaseViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: KUITableViewCell, for: indexPath)
        cell.layer.shouldRasterize = true
        cell.textLabel?.text = "Row \(indexPath.row) : \(tableviewDataArray[indexPath.row].title)"
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 0))
        return view
    }
}

