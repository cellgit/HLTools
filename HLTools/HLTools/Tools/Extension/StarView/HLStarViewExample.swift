//
//  HLStarViewExample.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/30.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLStarViewExample: UIViewController,EvaluateStarViewDelegate {
    func evaluateStarView(_ evaluateStarView: EvaluateStarView, progressChangedTo progress: Float) {
        //
        print("===== \(progress)")
    }
    
    
    @IBOutlet weak var starContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreStarView()
        
        evaluateScoreStarView()
    }
    
    
    
    func scoreStarView() {
        // 一句话设置评分星星
        starContainerView.hl_starView(score: 4.6, starWidth: 11)
    }
    
    func evaluateScoreStarView() {
        let starView = EvaluateStarView(frame: CGRect(x: 50, y: 300, width: 110, height: 22))
        starView.delegate = self
        view.addSubview(starView)
    }
    
    
    

}
