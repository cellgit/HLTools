//
//  SWCouponManager.swift
//  HLTools
//
//  Created by liuhongli on 2018/8/7.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

enum SWCouponType {
    ///折扣券
    case Discount
    ///现金券
    case Cash
}

class SWCouponManager: NSObject {
    
    static let shared = SWCouponManager()   /// 账簿单例(这是一个会计管家的账簿,记录着每一笔账单和收支平衡)
    
    /// 计算优惠券金额
    ///
    /// - Parameters:
    ///   - type: 优惠券类型
    ///   - value: 优惠券面值: 例如,现金券$10, 折扣券: 0.75
    ///   - price: 商品价格
    /// - Returns: 券金额
    public func calculateAmount(_ type: SWCouponType, _ value: Double, _ price: Double) -> Double {
        var couponValue: Double = 0
        switch type {
        case SWCouponType.Discount:
            couponValue = caculateDiscountValue(value: value, price: price)
        default:
            couponValue = value
        }
        return couponValue
    }
    
    
    /// 计算折扣券金额
    ///
    /// - Parameters:
    ///   - value: value: 折扣[0-1]
    ///   - price: 商品价格
    /// - Returns: 折扣券价值金额: 在指定商品价格下可抵用的金额
    private func caculateDiscountValue(value: Double, price: Double) -> Double {
        return value * price
    }
    
}
