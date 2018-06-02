//
//  HLGridViewListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLGridViewListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KGridViewIdentifier = "GridViewIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "GridView", identifier: KGridViewIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLGridViewListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KGridViewIdentifier)) {
            let vc:HLGridViewExampleVC = HLGridViewExampleVC.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
