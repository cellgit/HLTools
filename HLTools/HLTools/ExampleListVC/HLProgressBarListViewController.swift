//
//  HLProgressBarListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLProgressBarListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KCircleProgressBarIdentifier = "CircleProgressBarIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "CircleProgressBar", identifier: KCircleProgressBarIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLProgressBarListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KCircleProgressBarIdentifier)) {
            let vc:HLProgressBarViewController = HLProgressBarViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
