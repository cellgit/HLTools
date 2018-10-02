//
//  HLDocumentsExampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/1.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLDocumentsExampleViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var secondDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "访问DocumentsDirectory"
        setupUI()
    }
    func setupUI() {
        btn.layer.cornerRadius = 25
        btn.layer.borderColor = UIColor.magenta.cgColor
        btn.layer.borderWidth = 0.5
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        /// 获取沙盒路径
        let doctmentsDirUrl = SWDocumentsManager.shared.documentDirectory()
        /// 获取具体文件路径
        let plistUrl = SWDocumentsManager.shared.fileUrl("EpisodeList.plist")
        displayLabel.text = "Plist File Url: ===== \(plistUrl)"
        secondDisplayLabel.text = "Doctments Dir Url: ===== \(doctmentsDirUrl)"
        
        print("Doctments Dir Url: ===== \(doctmentsDirUrl)")
        print("Plist File Url: ===== \(plistUrl)")
    }
    
    
    
    func path() {
        /// 获取沙盒路径
        let doctmentsDirUrl = SWDocumentsManager.shared.documentDirectory()
        /// 获取具体文件路径
        let plistUrl = SWDocumentsManager.shared.fileUrl("EpisodeList.plist")
        print("Doctments Dir Url: ===== \(doctmentsDirUrl)")
        print("Plist File Url: ===== \(plistUrl)")
    }
}
