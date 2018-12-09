//
//  HLGradientListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/12/9.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLGradientListViewController: HLBaseViewController {
    let KGradientTextIdentifier = "GradientTextIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func tableViewData() {
        let data0 = HLTableViewDataStruct.init(title: "渐变字体", identifier: KGradientTextIdentifier)
        tableviewDataArray = [data0]
    }

}

extension HLGradientListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableviewDataArray[indexPath.row].identifier {
        case KGradientTextIdentifier:
            let vc = HLGradientTextExampleViewController()
            pushViewController(vc: vc, animated: true)
        default:
            break
        }
    }
    
}
