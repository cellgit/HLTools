//
//  HLImagePickerViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/8/24.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLImagePickerViewController: HLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "图片视频选择器"
    }
    
    let KImagePickerPhotoIdentifier = "ImagePickerPhotoIdentifier"
    override func tableViewData() {
        let data1 = HLTableViewDataStruct.init(title: "图片视频选择器", identifier: KImagePickerPhotoIdentifier)
        tableviewDataArray = [data1]
    }
    

    

}


extension HLImagePickerViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableviewDataArray[indexPath.row].identifier .elementsEqual(KImagePickerPhotoIdentifier)) {
            let vc = HLImagePickerPhotoExample.init()
            pushViewController(vc: vc, animated: true)
        }
    }
}


