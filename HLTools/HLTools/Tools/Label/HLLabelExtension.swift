//
//  HLLabelExtension.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/20.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

// MARK: - 使用方法：let labelSize = label.hl_labelSize(label: label), 然后更新设置label的布局即可
extension UILabel {
    /// 动态计算 label 的尺寸
    ///
    /// - Returns: label 的尺寸
    open func hl_labelSize(font: UIFont) -> CGSize {
        guard let string = self.text else { return CGSize.init() }
        let textMaxSize = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat(MAXFLOAT))
        var labelSize = self.hl_textSize(text:string , font: font, maxSize: textMaxSize)
        labelSize = CGSize(width: labelSize.width, height: labelSize.height)
        return labelSize
    }
    
    /// 动态计算 label 的尺寸,并给label添加一个尺寸的增补量
    ///
    /// - Parameters:
    ///   - font: 字号 font
    ///   - offsetSize: 尺寸增量：宽高的增补量
    /// - Returns: 计算后的label size
    open func hl_labelSizeWithOffset(font: UIFont, offsetSize: CGSize) -> CGSize {
        let originalSize =  self.hl_labelSize(font: font)
        let size = CGSize(width: originalSize.width + offsetSize.width, height: originalSize.height + offsetSize.height)
        return size
    }
    
    /// 动态计算字符串的尺寸
    ///
    /// - Parameters:
    ///   - text: 字符串
    ///   - font: 字符的 font
    ///   - maxSize: 最大 size
    /// - Returns: 字符串 size
    func hl_textSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font : font], context: nil).size
    }
}

// MARK: - 将大于 10000 的字符串类型数值转换为 "x万+" 的格式：例如：29999转换后是 "2万+"
// 用法：label.hl_tenThousandFormatText(stringValue: courseModel.num, descriable: descriable)
extension UILabel {
    func hl_tenThousandFormatText(stringValue: String, descriable: String) {
        let value = String.hl_stringToInt(string: stringValue)
        if value < 10000 {
            self.text = String(describing: value).appending(descriable)
        }
        else if value > 9999 {
            self.text = String(describing: Int(value/10000)).appending("万+").appending(descriable)
        }
    }
}


