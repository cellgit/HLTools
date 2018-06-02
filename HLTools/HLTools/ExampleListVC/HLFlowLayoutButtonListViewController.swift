//
//  HLFlowLayoutButtonListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLFlowLayoutButtonListViewController: HLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    let KFlowLayoutButtonIdentifier = "FlowLayoutButtonIdentifier"
    
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "FlowLayoutButton", identifier: KFlowLayoutButtonIdentifier)
        tableviewDataArray = [data1]
    }
}

extension HLFlowLayoutButtonListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KFlowLayoutButtonIdentifier)) {
            let vc:HLFlowLayoutViewController = HLFlowLayoutViewController.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}
