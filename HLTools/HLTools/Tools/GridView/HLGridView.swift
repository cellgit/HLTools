//
//  HLGridView.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/23.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

struct HLGridViewStruct {
    var views = [UIButton]()
}

class HLGridView: UIView {
    
    var views = [UIButton]()
    
    convenience init(frame: CGRect, views: [UIButton]) {
        self.init()
        self.frame = frame
        setupUI(views: views)
        
        self.views = views
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var subviewHeight: CGFloat = 0 {
        willSet {}
        didSet {
            
            setupUI(views: views)
        }
    }
    
    func setupUI(views: [UIButton]) {
        self.backgroundColor = .cyan
        let separatorWidth: CGFloat = 1
        let columnCount: Int = 10
        let subviewCount = views.count
        let rowCount = subviewCount / columnCount + (subviewCount % columnCount > 0 ? 1 : 0)
        let subviewWidth = floor(self.bounds.size.width - separatorWidth * CGFloat(columnCount - 1)) / CGFloat(columnCount)
        self.frame.size.height = CGFloat(rowCount) * subviewHeight + CGFloat(rowCount-1) * separatorWidth
        
        for item in self.subviews {
            if item.isKind(of: UIView.self) { item.removeFromSuperview() }
        }
        
        for row in 0 ..< views.count {
            for column in 0 ..< columnCount {
                let index = row * columnCount + column
                guard index < views.count else {
                    continue
                }
                let isLastColumn = column == columnCount - 1
                let isLastRow = row == rowCount - 1
                let offset_x = CGFloat(column) * CGFloat(subviewWidth + separatorWidth)
                let offset_y = (subviewHeight + separatorWidth) * CGFloat(row)
                if index%2 == 0 {
                    views[index].backgroundColor = .red
                }
                else {views[index].backgroundColor = .lightGray}
                views[index].action { (sender) in
                    //
                    sender.tag = index
                    print("====tag==== \(sender.tag)")
                }
                views[index].frame = CGRect(x: offset_x, y: offset_y, width: subviewWidth, height: subviewHeight)
                
                if isLastColumn {
                    // 每行最后一个item要占满剩余空间，否则可能因为strecthColumnWidth不精确导致右边漏空白
                    let v = CGFloat(columnCount - 1)
                    views[index].frame.size.width = self.bounds.size.width - subviewWidth * v - separatorWidth * v
                }
                if isLastRow {
                    // 最后一行的item要占满剩余空间，避免一些计算偏差
                    let h = rowCount - 1
                    views[index].frame.size.height = self.bounds.size.height - subviewHeight * CGFloat(h) - separatorWidth * CGFloat(h)
                }
                
                self.addSubview(views[index])
            }
        }
    }
}
