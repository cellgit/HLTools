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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonAction(_ sender: UIButton) {
        
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
