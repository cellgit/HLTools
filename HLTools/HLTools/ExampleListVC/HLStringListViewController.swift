//
//  HLStringListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLStringListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KRangeStringExtensionIdentifier = "RangeStringExtensionIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "RangeStringExtension", identifier: KRangeStringExtensionIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLStringListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KRangeStringExtensionIdentifier)) {
            let vc:HLStringExtensionExampleViewController = HLStringExtensionExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
