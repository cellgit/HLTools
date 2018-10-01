//
//  HLDocumentsListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/1.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLDocumentsListViewController: HLBaseViewController {
    let KDocumentsDirectoryIdentifier = "DocumentsDirectoryIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func tableViewData() {
        let data0 = HLTableViewDataStruct.init(title: "访问DocumentsDirectory", identifier: KDocumentsDirectoryIdentifier)
        tableviewDataArray = [data0]
    }
}
extension HLDocumentsListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KDocumentsDirectoryIdentifier)) {
            let vc = HLDocumentsExampleViewController()
            pushViewController(vc: vc, animated: true)
        }
        
    }
    
}
