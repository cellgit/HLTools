//
//  HLCalendarListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLCalendarListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "日历列表"
    }
    let KUIStoryboardCalandarIdentifier = "UIStoryboardCalandarIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "UIStoryboardCalandar", identifier: KUIStoryboardCalandarIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLCalendarListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KUIStoryboardCalandarIdentifier)) {
            let vc = UIStoryboard(name: "CalendarViewController", bundle: nil).instantiateViewController(withIdentifier: "KCalendarViewController") as UIViewController
            let viewController:CalendarViewController = vc as! CalendarViewController
            viewController.delegate = self
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
extension HLCalendarListViewController: SWCalendarDelegate {
    //MARK: SWCalendarDelegate 获取点击选择的日期
    func getSelectedDate(selectedDate: Date) {
        print("selectedDateString:\(selectedDate)")
    }
}

