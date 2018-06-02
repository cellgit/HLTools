//
//  HLPlayerListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/6/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLPlayerListViewController: HLBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let KPlayerIdentifier = "PlayerIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "Player", identifier: KPlayerIdentifier)
        tableviewDataArray = [data1]
    }
}
extension HLPlayerListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPlayerIdentifier)) {
            let urlStr: String = "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"
            let params = HLPlayerStruct.init(url: urlStr)
            let vc = HLPlayerViewController.init(params: params)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
