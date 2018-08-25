//
//  HLImagePickerPhotoExample.swift
//  HLTools
//
//  Created by 刘宏立 on 2018/8/24.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import YPImagePicker

class HLImagePickerPhotoExample: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var sigleVideoBtn: UIButton!
    @IBOutlet weak var multiSelectionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAction()
    }

    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        siglePhoto()
    }
    
    func buttonAction() {
        sigleVideoBtn.action { (sender) in
            self.sigleVideo()
        }
        multiSelectionBtn.action { (sender) in
            self.multiSelection()
        }
    }
    
    
}

extension HLImagePickerPhotoExample {
    func siglePhoto() {
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print("photo.fromCamera==\(photo.fromCamera)") // Image source (camera or library)
                print("photo.image===\(photo.image)") // Final image selected by the user
                print("photo.originalImage===\(photo.originalImage)") // original image selected by the user, unfiltered
                print("---===\(photo.modifiedImage)") // Transformed image, can be nil
                print("====--\(photo.exifMeta)") // Print exif meta data of original image.
                
                self.imgView.image = photo.image
                
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

extension HLImagePickerPhotoExample {
    func sigleVideo() {
        // Here we configure the picker to only show videos, no photos.
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .video]
        config.library.mediaType = .video
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let video = items.singleVideo {
                print("video.fromCamera=== \(video.fromCamera)")
                print("video.thumbnail==== \(video.thumbnail)")
                print("video.url========== \(video.url)")
                self.imgView.image = video.thumbnail
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}

extension HLImagePickerPhotoExample {
    func multiSelection() {
        var config = YPImagePickerConfiguration()
        config.library.maxNumberOfItems = 3
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    print("photo=== \(photo)")
                    self.imgView.image = photo.image
                case .video(let video):
                    print("video=== \(video)")
                    self.imgView.image = video.thumbnail
                }
            }
            
            if cancelled {
                print("Picker was canceled")
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
        
        
        
        present(picker, animated: true, completion: nil)
    }
}




