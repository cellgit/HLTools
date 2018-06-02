//
//  HLPopUpsContainerListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLPopUpsContainerListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KPopUpsContainerIdentifier = "PopUpsContainerIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "PopUpsContainer", identifier: KPopUpsContainerIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLPopUpsContainerListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPopUpsContainerIdentifier)) {
            let vc = UIStoryboard(name: "SWPopUpsContainerViewController", bundle: nil).instantiateViewController(withIdentifier: "KSWPopUpsContainerViewController") as UIViewController
            // 这里如果有tabBarController,需要用:self.viewController.tabBarController.present(vc, animated: true, completion: nil), 否则遮不住tabBar
            self.present(vc, animated: true, completion: nil)
        }
    }
}
