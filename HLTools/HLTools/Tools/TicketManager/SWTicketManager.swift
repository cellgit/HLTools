//
//  SWTicketManager.swift
//  HLTools
//
//  Created by liuhongli on 2018/8/7.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit


/// 计算票券金额的管家


///// 设置优惠券, 平台虚拟币, 金钱的使用优先级: 默认 coupon, ticket, cash
//struct SWTicketPriorityStruct {
//    var coupon: Int = 0
//    var ticket: Int = 1
//
//    func getPriority() -> SWTicketPriorityStruct {
//        let priority = SWTicketPriorityStruct.init(coupon: coupon, ticket: ticket)
//        return priority
//    }
//}




/*
 使用方法:
 调用: SWTicketManager.shared.sw_caculatePayAmount
 */


/// 存储票券使用后的数据
struct SWTicketReturnStruct {
    /// 实际用金钱(支付宝,微信或银行卡等)还需支付的金额
    var actuallyPay: Double = 0
    /// 用去的平台虚拟币: platform dollar used
    var platUsed: Double = 0
    /// 剩余的的平台虚拟币: platform dollar last
    var platLast: Double = 0
    /// 是否使用优惠券: 默认false(不使用)
    var isCouponOn: Bool = false
    /// 是否使用平台虚拟币: 默认false(不使用)
    var isTicketOn: Bool = false
    
}


class SWTicketManager: NSObject {
    /// 管理器单例(这是一个会计管家,管理所有的账目变化)
    public static let shared = SWTicketManager()
    /// 账簿: 会计的账簿记录着账单的每一次账目变化
    var accountBookManager = SWAccountBook.shared
    /// 优惠券单例
    var couponManager = SWCouponManager.shared
    /// 平台虚拟币,比如高护网的前程票, 兑换比例1:1
    var platTicket: Double = 0
    
    var priority: Double = 0
    
    
    /// 用户给出使用方式(在一次交易中使用的支付: 包含优惠券,平台虚拟币,金钱)后,自动返回最终需要金钱支付的金额
    
    
    public func sw_caculatePayAmount(_ price: Double,
                           _ coupon: Double,
                           _ ticket: Double,
                           _ isCouponOn: Bool,
                           _ isTicketOn: Bool,
                           _ type: SWCouponType) -> SWTicketReturnStruct {
        
        if price < 0 {
            print("Error: 商品价格不能为负")
            return SWTicketReturnStruct.init(actuallyPay: 0, platUsed: 0, platLast: ticket, isCouponOn: isCouponOn, isTicketOn: isTicketOn)
        }
        
        /// 优惠券可抵用金额
        let couponValue = couponManager.calculateAmount(type, coupon, price)
        
        ///计算还需支付金额
        var actuallyPay: Double = 0
        var ticketUsed: Double = 0  /// 用去的平台虚拟币
        var ticketLast: Double = 0  /// 剩下的平台虚拟币
        
        let couponTicketAdd = couponValue + ticket
        
        if isCouponOn == true && isTicketOn == true {
            
            if couponValue >= price {   //只需要优惠券即可
                ticketUsed = 0
                ticketLast = ticket
                actuallyPay = 0
            }
            else if couponValue < price && couponTicketAdd >= price { //只需要优惠券和平台虚拟币即可
                ticketUsed = price - couponValue    /// 用去的平台虚拟币
                ticketLast = ticket - ticketUsed    /// 剩余的平台虚拟币
                actuallyPay = 0
            }
            else if couponTicketAdd < price {   //需要优惠券和平台虚拟币和银行金钱支付
                ticketUsed = ticket    /// 用去的平台虚拟币
                ticketLast = 0         /// 剩余的平台虚拟币
                actuallyPay = price - couponTicketAdd       /// 实际还需支付
            }
        }
        else if isCouponOn == true && isTicketOn == false { /// 不使用平台虚拟币
            if couponValue >= price {   //只需要优惠券即可
                ticketUsed = 0
                ticketLast = ticket
                actuallyPay = 0
            }
            else if couponValue < price { //只需要优惠券和平台虚拟币即可
                ticketUsed = 0    /// 用去的平台虚拟币
                ticketLast = ticket    /// 剩余的平台虚拟币
                actuallyPay = price - couponValue   /// 实际还需支付
            }
            else {
                print("注:这个理论上永远不会执行,如果执行了,说明出错了(这个类的错误)")
            }
        }
        else if isCouponOn == false && isTicketOn == true { /// 不使用平台优惠券
            if ticket >= price {   //只需要优惠券即可
                ticketUsed = price
                ticketLast = ticket - price
                actuallyPay = 0
            }
            else if ticket < price { //只需要优惠券和平台虚拟币即可
                ticketUsed = ticket    /// 用去的平台虚拟币
                ticketLast = 0    /// 剩余的平台虚拟币
                actuallyPay = price - ticket   /// 实际还需支付
            }
            else {
                print("注:这个理论上永远不会执行,如果执行了,说明出错了(这个类的错误)")
            }
        }
        else {
            // 只用金钱: 啥都不需要做
            ticketUsed = 0    /// 用去的平台虚拟币
            ticketLast = ticket    /// 剩余的平台虚拟币
            actuallyPay = price   /// 实际还需支付
        }
        
        return SWTicketReturnStruct.init(actuallyPay: actuallyPay, platUsed: ticketUsed, platLast: ticketLast, isCouponOn: isCouponOn, isTicketOn: isTicketOn)
    }
    
}
