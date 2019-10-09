//
//  HLStarViewExample.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/5/30.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit

class HLStarViewExample: UIViewController {
    
    @IBOutlet weak var starContainerView: UIView!
    
    var scoreLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        scoreStarView()
        evaluateScoreStarView()
    }
    
    func setupUI() {
        scoreLabel = UILabel.init(frame: CGRect(x: 0, y: 220, width: ScreenWidth, height: 30))
        scoreLabel.text = "点击或滑动下面的星星进行评分"
        self.view.addSubview(scoreLabel)
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = UIColor.gray
    }
    
    
    /// 一句话设置评分星星
    func scoreStarView() {
        starContainerView.hl_starView(score: 4.6, starWidth: 11)
    }
}

extension HLStarViewExample: EvaluateStarViewDelegate {
    /// edit star score, via tap and pan gesture
    func evaluateScoreStarView() {
        let height: CGFloat = 18
        let starView = EvaluateStarView(frame: CGRect(x: (ScreenWidth - height*5) / 2 , y: 200, width: height*5, height: height))
        starView.delegate = self
        self.view.addSubview(starView)
        starView.backgroundColor = .lightGray
    }
    func evaluateStarView(_ evaluateStarView: EvaluateStarView, progressChangedTo progress: Float) {
        print("===== \(progress)")
        scoreLabel.text = String(progress * 5)
    }
}


