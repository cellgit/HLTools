//
//  HLStringExtension.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/20.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

/// 数值型字符串转换为 Double
/// 用法：let value = String.sw_stringToInt(string: stringValue)
extension String {
    static func hl_stringToDouble(string: String) -> Double {
        let str = string
        guard let doubleValue = Double(str) else { return Double.init()}
        return doubleValue
    }
    static func hl_stringToCGFloat(string: String) -> CGFloat {
        let doubleValue = String.hl_stringToDouble(string: string)
        let cgfloatValue = CGFloat.init(doubleValue)
        return cgfloatValue
    }
    static func hl_stringToInt(string: String) -> Int {
        let doubleValue = String.hl_stringToDouble(string: string)
        let intValue = Int.init(doubleValue)
        return intValue
    }
}
