//
//  HLRealTimeCameraSampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/2.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import AVKit
import Vision

class HLRealTimeCameraSampleViewController: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "机器学习"
        startCamera()
    }
    
    func startCamera() {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        captureSession.startRunning()
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("Camera isable to capture a frame: ", Date())
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        if #available(iOS 11.0, *) {
            ///其它模型因文件过大删除,需要自行下载
            
//            guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {return}   //SqueezeNet模型
//            guard let model = try? VNCoreMLModel(for: GoogLeNetPlaces().model) else {return} //GoogLeNetPlaces模型
//            guard let model = try? VNCoreMLModel(for: MobileNet().model) else {return} //GoogLeNetPlaces模型
            guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {return} //GoogLeNetPlaces模型
            let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
//                print("finishedReq: \(String(describing: finishedReq.results))")
                guard let result = finishedReq.results as? [VNClassificationObservation] else {return}
                guard let firstObservation = result.first else {return}
                print("firstObservation: \(firstObservation.identifier)== \(firstObservation.confidence)")
                DispatchQueue.main.async(execute: {
                    self.nameLabel.text = "名字:\(firstObservation.identifier)"
                    self.displayLabel.text = "准确度:\(String(format:"%.2f",firstObservation.confidence))"
                })
            }
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        } else {
            // Fallback on earlier versions
        }
    }
}
