//
//  HLPhotosCoreMLSampleViewController.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/10/3.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import CoreML
import Vision

class HLPhotosCoreMLSampleViewController: UIViewController,UINavigationControllerDelegate {
    
    @IBOutlet weak var photoSelected: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var confidenceLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "机器学习"
    }
    
    @IBAction func grabPhoto(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Take a photo", style: .default, handler: {
            _ in
            self.takePhoto(from: .camera)
        })
        let libraryAction = UIAlertAction(title: "Choose from Photos", style: .default, handler: {
            _ in
            self.takePhoto(from: .photoLibrary)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true, completion: nil)
    }
}


extension HLPhotosCoreMLSampleViewController {
    enum PhotoSource {
        case camera, photoLibrary
    }
    
    func takePhoto(from source: PhotoSource) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = (source == .camera ? .camera : .photoLibrary)
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    func resize(image: UIImage, to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
extension HLPhotosCoreMLSampleViewController {
    func guess(image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            fatalError("Cannot create a core image object.")
        }
        if #available(iOS 11.0, *) {
            // 1. Load model
            guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {
                fatalError("Cannot load CoreML model.")
            }
            // 2. Create a Vision request
            let request = VNCoreMLRequest(model: model) {
                (request, error) in
                guard let results = request.results as? [VNClassificationObservation],
                    let firstResult = results.first else {
                        fatalError("Cannot fetch result from VNCoreMLRequest...")
                }
                DispatchQueue.main.async {
                    self.nameLabel.text = firstResult.identifier
                    self.confidenceLabel.text = "\(firstResult.confidence * 100)"
                }
            }
            // 3. Perform the request
            let handler = VNImageRequestHandler(ciImage: ciImage)
            DispatchQueue.global(qos: .userInteractive).async {
                try? handler.perform([request])
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

extension HLPhotosCoreMLSampleViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            photoSelected.image = image
            if let newImage = resize(image: image, to: CGSize(width: 224, height: 224)) {
                guess(image: newImage)
            }
        }
    }
}


