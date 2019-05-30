//
//  ViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 5/19/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.delegate = self
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
//                case .notDetermined:
//                    <#code#>
//                case .restricted:
//                    <#code#>
//                case .denied:
//                    <#code#>
                }
            }
        }
    }
    
    @IBAction func removePhoto(_ sender: Any) {
        let data: Data? = nil
        UserDefaults.standard.set(data, forKey: "myImageKey")
    }
}


extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let pickedImage = rotateImage(image: image)
            let data = pickedImage.pngData()
            UserDefaults.standard.set(data, forKey: "myImageKey")
            UserDefaults.standard.synchronize()
        }
        
        dismiss(animated:true)
    }
}

func rotateImage(image: UIImage) -> UIImage {
    
    if (image.imageOrientation == UIImage.Orientation.up ) {
        return image
    }
    
    UIGraphicsBeginImageContext(image.size)
    
    image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
    let copy = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return copy!
}
