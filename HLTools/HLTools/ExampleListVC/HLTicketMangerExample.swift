//
//  HLTicketMangerExample.swift
//  HLTools
//
//  Created by liuhongli on 2018/8/10.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLTicketMangerExample: UIViewController {
    
    @IBOutlet weak var couponSwitch: UISwitch!
    @IBOutlet weak var ticketSwitch: UISwitch!
    
    var couponIsOn: Bool = false    // 优惠券是否使用状态
    var ticketIsOn: Bool = false    // 平台币是否使用状态
    var couponType: SWCouponType = SWCouponType.Cash
    

    var price: Double = 100
    var coupon: Double = 0.5
    var ticket: Double = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        couponType = SWCouponType.Discount
        couponSwitch.isOn = false
        ticketSwitch.isOn = false
    }

    
    
    @IBAction func couponAction(_ sender: UISwitch) {
        couponIsOn = sender.isOn
        let params = SWTicketManager.shared.sw_caculatePayAmount(price, coupon, ticket, couponIsOn, ticketIsOn, couponType)
        
        print("======\(params)")
    }
    
    
    @IBAction func platDollarAction(_ sender: UISwitch) {
        ticketIsOn = sender.isOn
        let params = SWTicketManager.shared.sw_caculatePayAmount(price, coupon, ticket, couponIsOn, ticketIsOn, couponType)
        print("======\(params)")
    }
    
}
