//
//  HLConfiguration.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/29.
//  Copyright © 2018年 lhl. All rights reserved.
//


/*
 self.clearColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
 self.whiteColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
 self.blackColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
 self.grayColor = UIColorMake(179, 179, 179);
 self.grayDarkenColor = UIColorMake(163, 163, 163);
 self.grayLightenColor = UIColorMake(198, 198, 198);
 self.redColor = UIColorMake(227, 40, 40);
 self.greenColor = UIColorMake(79, 214, 79);
 self.blueColor = UIColorMake(43, 133, 208);
 self.yellowColor = UIColorMake(255, 252, 233);
 
 self.linkColor = UIColorMake(56, 116, 171);
 self.disabledColor = self.grayColor;
 self.backgroundColor = UIColorMake(246, 246, 246);
 self.maskDarkColor = UIColorMakeWithRGBA(0, 0, 0, .35f);
 self.maskLightColor = UIColorMakeWithRGBA(255, 255, 255, .5f);
 self.separatorColor = UIColorMake(200, 199, 204);
 self.separatorDashedColor = UIColorMake(17, 17, 17);
 self.placeholderColor = UIColorMake(187, 187, 187);
 
 self.testColorRed = UIColorMakeWithRGBA(255, 0, 0, .3);
 self.testColorGreen = UIColorMakeWithRGBA(0, 255, 0, .3);
 self.testColorBlue = UIColorMakeWithRGBA(0, 0, 255, .3);
 
 #pragma mark - UIControl
 
 self.controlHighlightedAlpha = 0.5f;
 self.controlDisabledAlpha = 0.5f;

 */

import UIKit

class HLConfiguration: NSObject {
    
}


class HLColor: UIColor {
    static func color(R r:CGFloat, G g:CGFloat, B b:CGFloat, A alpha:CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        return color
    }
    
    static let themeColor =  HLColor.color(R: 43, G: 133, B: 208, A: 1.0)
}


