//
//  HLConfiguration.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/29.
//  Copyright © 2018年 lhl. All rights reserved.
//


import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height


let KDeviceDirector = UIDevice.current.orientation

public let NavigationH: CGFloat = UIScreen.main.bounds.size.height >= 812 ? 88 : 64
public let CMMagin: CGFloat = 10
public let AppWidth: CGFloat = UIScreen.main.bounds.size.width
public let AppHeight: CGFloat = UIScreen.main.bounds.size.height
public let AppSize: CGRect = UIScreen.main.bounds
public let SafeAreaTopHeight : CGFloat = UIScreen.main.bounds.size.height == 812 ? 88 : 64
public let TabarHeight : CGFloat = UIScreen.main.bounds.size.height == 812 ? 83 : 49


class HLConfiguration: NSObject {
    
}


class HLColor: UIColor {
    static func color(R r:CGFloat, G g:CGFloat, B b:CGFloat, A alpha:CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        return color
    }
    

    
}

extension HLColor {
    //和系统重复的 "Color", 均写成 "Colour"
    static let themeColor =  HLColor.color(R: 43, G: 133, B: 208, A: 1.0)
    
    static let clearColour =  HLColor.color(R: 255, G: 255, B: 255, A: 0.0)
    static let whiteColour =  HLColor.color(R: 255, G: 255, B: 255, A: 1.0)
    static let blackColour =  HLColor.color(R: 0, G: 0, B: 0, A: 1.0)
    static let grayColour =  HLColor.color(R: 179, G: 179, B: 179, A: 1.0)
    static let grayDarkenColour =  HLColor.color(R: 163, G: 163, B: 163, A: 1.0)
    static let grayLightenColour =  HLColor.color(R: 198, G: 198, B: 198, A: 1.0)
    static let redColour =  HLColor.color(R: 227, G: 40, B: 40, A: 1.0)
    static let greenColour =  HLColor.color(R: 79, G: 214, B: 79, A: 1.0)
    static let blueColour =  HLColor.color(R: 43, G: 133, B: 208, A: 1.0)
    static let yellowColour =  HLColor.color(R: 255, G: 252, B: 233, A: 1.0)
    
//    static let linkColor =  HLColor.color(R: 56, G: 116, B: 171, A: 1.0)
    static let disabledColor =  HLColor.color(R: 179, G: 179, B: 179, A: 1.0)
    static let backgroundColor = HLColor.color(R: 246, G: 246, B: 246, A: 1.0)
    static let maskDarkColor = HLColor.color(R: 0, G: 0, B: 0, A: 0.35)
    static let maskLightColor = HLColor.color(R: 255, G: 255, B: 255, A: 0.5)
//    static let separatorColor = HLColor.color(R: 200, G: 199, B: 204, A: 1.0)
    static let separatorDashedColor = HLColor.color(R: 17, G: 17, B: 17, A: 1.0)
    static let placeholderColor = HLColor.color(R: 187, G: 187, B: 187, A: 1.0)
    
    static let testColorRed = HLColor.color(R: 255, G: 0, B: 0, A: 0.3)
    static let testColorGreen = HLColor.color(R: 0, G: 255, B: 0, A: 0.3)
    static let testColorBlue = HLColor.color(R: 0, G: 0, B: 255, A: 0.3)
    
    static let controlHighlightedAlpha:CGFloat = 0.5
    static let controlDisabledAlpha:CGFloat = 0.5
    
    static let buttonTintColor = HLColor.color(R: 43, G: 133, B: 208, A: 1.0)   // 按钮颜色
}

let HLSpringAnimationKey = "HLSpringAnimationKey";
class HLAnimation: NSObject {
    static func actionSpringAnimationForView(view:UIView) {
        let duration: NSNumber = 0.6
        let t0:NSNumber = (0.00 / (duration as! Decimal)) as NSNumber
        let t1:NSNumber = (0.15 / (duration as! Decimal)) as NSNumber
        let t2:NSNumber = (0.30 / (duration as! Decimal)) as NSNumber
        let t3:NSNumber = (0.45 / (duration as! Decimal)) as NSNumber
        let springAnimation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        springAnimation.values = [0.85, 1.15, 0.9, 1.0]
        springAnimation.keyTimes = [t0, t1, t2, t3]
        springAnimation.duration = CFTimeInterval(truncating: duration)
        view.layer.add(springAnimation, forKey: HLSpringAnimationKey)
        
    }
    
}


