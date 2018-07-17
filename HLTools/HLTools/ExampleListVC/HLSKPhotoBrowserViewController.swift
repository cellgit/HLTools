//
//  HLSKPhotoBrowserViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/7/17.
//  Copyright © 2018 lhl. All rights reserved.
//


/// 注: 基于 SKPhotoBrowser
/// SKPhotoBrowser 地址: https://github.com/suzuki-0000/SKPhotoBrowser

import UIKit
import SKPhotoBrowser

class HLSKPhotoBrowserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        let button = UIButton.init(type: .custom)
        self.view.addSubview(button)
        button.frame = CGRect(x: (ScreenWidth - 200)/2, y: 100, width: 200, height: 60)
        button.setTitle("SKPhotoBrowser", for: .normal)
        button.backgroundColor = UIColor.magenta
        button.titleLabel?.textColor = UIColor.darkGray
        
        let imageNames = ["photo000.jpg",
                          "photo001.jpg",
                          "photo002.jpg",
                          "photo003.jpg",
                          "photo004.jpg",
                          "photo005.jpg"]
        
        var imageArray = [UIImage]()
        for item in imageNames {
            guard let image = UIImage.init(named: item) else { return }
            imageArray.append(image)
        }
        button.action { (sender) in
            self.skimPhotos(imageArray)
        }
    }

}

extension HLSKPhotoBrowserViewController{
    func skimPhotos(_ imageArray: [UIImage]) {
        // 1. create SKPhoto Array from UIImage
        var images = [SKPhoto]()
        for item in imageArray {
            let photo = SKPhoto.photoWithImage(item)
            images.append(photo)
        }
        // 2. create PhotoBrowser Instance, and present from your viewController.
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(3)
        present(browser, animated: true, completion: {})
    }
}
