//
//  HLCoreMLListViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLCoreMLListViewController: HLBaseViewController {
    let KRealTimeCameraIdentifier = "RealTimeCameraIdentifier"
    let KPhotosCoreMLIdentifier = "PhotosCoreMLIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableViewData() {
        let data0 = HLTableViewDataStruct.init(title: "机器学习", identifier: KRealTimeCameraIdentifier)
        let data1 = HLTableViewDataStruct.init(title: "机器学习: 拍照或相册", identifier: KPhotosCoreMLIdentifier)
        tableviewDataArray = [data0,
                              data1]
    }
}

extension HLCoreMLListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableviewDataArray[indexPath.row].identifier {
        case KRealTimeCameraIdentifier:
            let vc = HLRealTimeCameraSampleViewController()
            pushViewController(vc: vc, animated: true)
        case KPhotosCoreMLIdentifier:
            let vc = HLPhotosCoreMLSampleViewController()
            pushViewController(vc: vc, animated: true)
        default:
            break
        }
        
//        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KRealTimeCameraIdentifier)) {
//            let vc = HLRealTimeCameraSampleViewController()
//            pushViewController(vc: vc, animated: true)
//        }
//        else if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KPhotosCoreMLIdentifier)){
//            let vc = HLPhotosCoreMLSampleViewController()
//            pushViewController(vc: vc, animated: true)
//        }
    }
    
}
