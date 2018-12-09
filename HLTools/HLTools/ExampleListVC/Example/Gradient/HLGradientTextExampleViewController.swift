//
//  HLGradientTextExampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/12/9.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLGradientTextExampleViewController: UIViewController {
    let appTitleView: UIView = {
    let frame = CGRect(x: 0, y: 0,
                       width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
    /// 1. Create a holder view
    let view = UIView(frame: frame)
    
    /// 2. Cover it with a gradient color layer
    let gradient = CAGradientLayer()
    gradient.frame = view.bounds
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//    gradient.colors = [
//        Color.appTitleGradientBegin.cgColor,
//        Color.appTitleGradientMid.cgColor,
//        Color.appTitleGradientEnd.cgColor]
        
        
        gradient.colors = [
            UIColor.green.cgColor,
            UIColor.red.cgColor,
            UIColor.magenta.cgColor]
        
    view.layer.addSublayer(gradient)
    
    /// 3. Mask the UILabel onto the color layer
    let label = UILabel(frame: view.bounds)
    label.text = "App工匠的4K视频"
    label.numberOfLines = 0
    label.textAlignment = .center
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
        if #available(iOS 11.0, *) {
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        } else {
            // Fallback on earlier versions
        }
    
    view.addSubview(label)
    view.mask = label
    
    return view
}()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "渐变字体"

        self.view.addSubview(appTitleView)
        
        appTitleView.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }


    

}
