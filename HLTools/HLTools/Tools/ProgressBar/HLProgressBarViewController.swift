//
//  HLProgressBarViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/3/29.
//  Copyright © 2018年 lhl. All rights reserved.
//

import UIKit

class HLProgressBarViewController: HLBaseViewController,URLSessionDownloadDelegate {
    
    let shapelayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupUI()
    }
    
    
    func configuration() {
        self.title = "进度条"
    }
    
    func setupUI() {
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.position = view.center
        view.layer.addSublayer(trackLayer)
        shapelayer.path = circularPath.cgPath
        shapelayer.strokeColor = HLColor.themeColor.cgColor
        shapelayer.lineWidth = 10.0
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeEnd = 0
        shapelayer.lineCap = kCALineCapRound
        shapelayer.position = view.center
        view.layer.addSublayer(shapelayer)
        shapelayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    let urlString = "https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c"
    func beginDownLoadingFile() {
        print("attempting to animate stroke")
        shapelayer.strokeEnd = 0
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        guard let url = URL(string:urlString) else {return}
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) /
            CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.shapelayer.strokeEnd = percentage
        }
        print(percentage)
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("finished downloading file")
    }
    fileprivate func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapelayer.add(basicAnimation, forKey: "urSoBasic")
    }
    @objc private func handleTap() {
        print("tap to animate stroke")
        beginDownLoadingFile()
        //        animateCircle()
    }
}





