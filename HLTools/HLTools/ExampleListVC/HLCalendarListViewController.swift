//
//  HLCalendarListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLCalendarListViewController: UIViewController {
    
    let KUIStoryboardCalandarIdentifier = "UIStoryboardCalandarIdentifier"
    
    
    
    
    let KUITableViewCell = "UITableViewCell"
    var tableView:UITableView!
    var tableviewDataArray = [HLTableViewDataStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "日历列表"
        
        tableViewData()
        setTableViewUI()
    }
    func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "UIStoryboardCalandar", identifier: KUIStoryboardCalandarIdentifier)
        tableviewDataArray = [data1]
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
        } else {}
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: KUITableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HLCalendarListViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: KUITableViewCell, for: indexPath) as! UITableViewCell
        cell.layer.shouldRasterize = true
        cell.textLabel?.text = "row \(indexPath.row): -- \(tableviewDataArray[indexPath.row].title)"
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.textLabel?.textColor = UIColor.init(red: 43/255.0, green: 133/255.0, blue: 208/255.0, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KUIStoryboardCalandarIdentifier)) {
            let vc = UIStoryboard(name: "CalendarViewController", bundle: nil).instantiateViewController(withIdentifier: "KCalendarViewController") as UIViewController
            let viewController:CalendarViewController = vc as! CalendarViewController
            viewController.delegate = self
            self.present(viewController, animated: true, completion: nil)
        }
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


extension HLCalendarListViewController: SWCalendarDelegate {
    //MARK: SWCalendarDelegate 获取点击选择的日期
    func getSelectedDate(selectedDate: Date) {
        print("selectedDateString:\(selectedDate)")
    }
}

