//
//  HLPopoverListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLPopoverListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KPopoverIdentifier = "KPopoverIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "Popover", identifier: KPopoverIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLPopoverListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPopoverIdentifier)) {
            let vc = UIStoryboard(name: "HLPopoverViewController", bundle: nil).instantiateViewController(withIdentifier: "KHLPopoverViewController") as UIViewController
            pushViewController(vc: vc, animated: true)
        }
    }
}
