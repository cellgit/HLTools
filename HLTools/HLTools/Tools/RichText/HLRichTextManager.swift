//
//  HLRichTextManager.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/20.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLRichTextManager: NSObject {
    static let shared = HLRichTextManager()
    
    /* html富文本转换成label可正常显示
     usage: 1. tableViewCell的子 label，在tableView的 cellForRow 数据源方法中用如下格式即可
     
     写法一：
     let htmlText = safeBookDetailModel.d_content
     let attriStr = HLRichTextManager.shared.htmlTextString(htmlText: htmlText)
     cell.content.attributedText = attriStr
     
     写法二：
     OR 传递model至自定义 cell，后在自定义cell下面 以下格式
     
     open var model: MessageModel? {
     willSet {}
     didSet {
     guard let htmlText = model?.content else { return }
     let attriStr = HLRichTextManager.shared.htmlTextString(htmlText: htmlText)
     contentLabel.attributedText = attriStr
     }
     }
     */
    open func htmlTextString(htmlText: String) -> NSAttributedString {
        do{
            let attrStr = try NSAttributedString(data: htmlText.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attrStr
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        return NSAttributedString.init()
    }
    
    /// html文本转换为label显示的字符串
    ///
    /// - Parameters:
    ///   - label: label
    ///   - htmlText: html的原始文本
    ///   - lineSpacing: 行间距
    ///   - font: 字号
    /*
     usage: example
     SWRichTextManager.shared.htmlTextString(label: contentLabel, htmlText: htmlText, lineSpacing: 8, font: 13)
     */
    open func htmlTextString(label: UILabel, htmlText: String, lineSpacing: CGFloat, font: CGFloat) {
        let attriStr = htmlTextString(htmlText: htmlText)
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = lineSpacing
        let attributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: font),
                          NSAttributedStringKey.paragraphStyle: paraph]
        let str = attriStr.string
        label.attributedText = NSAttributedString(string: str, attributes: attributes)
        label.lineBreakMode = .byTruncatingTail //attributedText需要重新设置，才会出现省略号
    }
    
    open func richTextString(text: String, font: CGFloat,color: UIColor) -> NSAttributedString {
        let attriStr = htmlTextString(htmlText: text)
        let paraph = NSMutableParagraphStyle()
        let attributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: font),
                          NSAttributedStringKey.foregroundColor: color,
                          NSAttributedStringKey.paragraphStyle: paraph]
        let str = attriStr.string
        
        let attributedString = NSAttributedString(string: str, attributes: attributes)
        return attributedString
        //        label.lineBreakMode = .byTruncatingTail //attributedText需要重新设置，才会出现省略号
    }
}
