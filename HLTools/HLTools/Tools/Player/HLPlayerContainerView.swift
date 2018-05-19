//
//  HLPlayerContainerView.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/4/30.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import AVKit

class HLPlayerContainerView: UIView {
    
    open var player: AVPlayer = AVPlayer()
    var playerLayer: AVPlayerLayer = AVPlayerLayer()
    open var url: URL?
    
    
    
    
    var playerContainerView: UIView!
    

    override init(frame: CGRect) {
        self.init()
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(params: HLPlayerStruct) {
        self.init()
        
        self.url = URL.init(string: params.url)
    }
    
    
    
    
    func setupUI() {
        guard let videoUrl = self.url else { return }
        player = AVPlayer(url: videoUrl)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        self.layer.addSublayer(playerLayer)
    }

}


extension UIView {
    
    
    
    
    
    
    
    
    
    
}





