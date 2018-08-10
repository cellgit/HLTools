//
//  HLTicketMangerViewController.swift
//  HLTools
//
//  Created by liuhongli on 2018/8/7.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLTicketMangerViewController: HLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "票券管理器"
    }

    let KTicketIdentifier = "TicketIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "票券管理器", identifier: KTicketIdentifier)
        tableviewDataArray = [data1]
    }
}

extension HLTicketMangerViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KTicketIdentifier)) {
            let vc = HLTicketMangerExample.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
