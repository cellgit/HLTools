//
//  HLScoreMarkListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLScoreMarkListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KStarViewIdentifier = "StarViewIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "StarView", identifier: KStarViewIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLScoreMarkListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KStarViewIdentifier)) {
            let vc = HLStarViewExample.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
