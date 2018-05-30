//
//  HLStarViewExample.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/30.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLStarViewExample: UIViewController {
    
    @IBOutlet weak var starContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 一句话设置评分星星
        starContainerView.sw_starView(score: 3.6, starWidth: 11)
    }

}
