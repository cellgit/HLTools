//
//  HLClosureListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/3.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLClosureListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let KClosureButtonIdentifier = "ClosureButtonIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "ClosureButton", identifier: KClosureButtonIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLClosureListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KClosureButtonIdentifier)) {
            let vc = HLClosureButtonExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
