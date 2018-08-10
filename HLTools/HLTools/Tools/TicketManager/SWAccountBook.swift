//
//  SWAccountBook.swift
//  HLTools
//
//  Created by liuhongli on 2018/8/7.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class SWAccountBook: NSObject {
    static let shared = SWAccountBook()   /// 账簿单例(这是一个会计管家的账簿,记录着每一笔账单和收支平衡)
    
    ///账簿的余额
    var balance: Double = 0
    ///收入
    var income: Double = 0
    ///支出
    var expend: Double = 0
    
    /// caculate the balance
    func caculateBalance(balance: Double, income: Double, expend: Double) -> Double {
        var balance = balance
        balance = balance + income - expend
        return balance
    }
}
