//
//  HLButtonListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

/// 继承自 HLBaseViewController
class HLButtonListViewController: HLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let KImageButtonIdentifier = "ImageButtonIdentifier"
    
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "ImageButton -- HLButtonExample", identifier: KImageButtonIdentifier)
        tableviewDataArray = [data1]
    }
}


extension HLButtonListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KImageButtonIdentifier)) {
            let vc:HLButtonExampleViewController = HLButtonExampleViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
