//
//  SWDocumentsManager.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/1.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class SWDocumentsManager: NSObject {
    
    static let shared = SWDocumentsManager()   /// 管理路径的管家
    
    /// 获取沙盒路径
    func documentDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }
    /// 获取具体文件路径
    func fileUrl(_ fileName: String) -> URL {
        let documentUrl = self.documentDirectory().appendingPathComponent(fileName)
        return documentUrl
    }
}
