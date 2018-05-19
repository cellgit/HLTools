//
//  HLPlayerViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/4/30.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import AVKit

class HLPlayerViewController: UIViewController {
    private var url: URL?
    
    open var player: AVPlayer = AVPlayer()
    var playerLayer: AVPlayerLayer = AVPlayerLayer()
    
    var containerView: UIView!
    
    
    convenience init(params: HLPlayerStruct) {
        self.init()
        
        self.url = URL.init(string: params.url)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        setupUI()
    }

    func setupUI() {
        
//        let duration = UIDevice.current.orientation
//        duration.isLandscape
        
        
        let y: CGFloat = 64.0
        let frame: CGRect = CGRect(x: 0, y: y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9.0/16.0)
        
        
        
        let containerView = UIView.init(frame: frame)
        self.view.addSubview(containerView)
        
        
        player = AVPlayer(url: self.url!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        containerView.layer.addSublayer(playerLayer)
        containerView.backgroundColor = .red
        
        containerView.contentMode = .scaleToFill
        
        playerLayer.frame = containerView.bounds
        
        self.containerView = containerView
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
        super.viewDidLayoutSubviews()
        self.player.play()
    }

    
    override func viewDidLayoutSubviews() {
        layoutPlayer(isLandscape: KDeviceDirector.isLandscape)
        
    }
    
    func layoutPlayer(isLandscape: Bool) {
        
        if isLandscape {
            let frame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9.0/16.0)
            self.containerView.frame = frame
            playerLayer.frame = self.containerView.bounds
            
            let transform: CGAffineTransform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI_2))
            self.containerView.transform = transform
        }
        else {
            let y: CGFloat = 64.0
            let frame: CGRect = CGRect(x: 0, y: y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 9.0/16.0)
            self.containerView.frame = frame
            playerLayer.frame = self.containerView.bounds
            
            let transform: CGAffineTransform = CGAffineTransform.init(rotationAngle: CGFloat(0))
            self.containerView.transform = transform
        }
        
    }
    
    
    

}
