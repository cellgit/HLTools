//
//  SWCalendarCell.swift
//  CampusSafety
//
//  Created by liuhongli on 2018/3/29.
//  Copyright © 2018年 CampusSafety. All rights reserved.
//

import UIKit
import JTAppleCalendar

class SWCalendarCell: JTAppleCell {
    
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var selectedView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupUI() {
        dateLabel.layer.borderWidth = 1
        dateLabel.layer.borderColor = UIColor.red.cgColor
    }
    
//    override func draw(_ rect: CGRect) {
//        dateLabel.layer.borderWidth = 1
//        dateLabel.layer.borderColor = UIColor.red.cgColor
//    }
    
    
}
