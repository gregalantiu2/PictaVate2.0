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
    
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPhotoUploadStatus()
    }
    
    //Checks to see if photo exists and whether or not to show the remove button
    func checkPhotoUploadStatus(){
        if UserDefaults.standard.data(forKey: "myImageKey") == nil
        {
            removeButton.isHidden = true
        }
        else{
            removeButton.isHidden = false
        }
    }

    @IBAction func viewPicture(_ sender: Any) {
        if UserDefaults.standard.data(forKey: "myImageKey") == nil
        {
            viewAlert(title: "Upload Motivating Picture", message: "Looks like you do not have a picture uploaded yet")
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "PhotoView")
            controller.modalTransitionStyle = .crossDissolve
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func viewAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Upload", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            self.uploadPhoto()
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert,animated:true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        if UserDefaults.standard.data(forKey: "myImageKey") == nil
        {
            uploadPhoto()
        }
        else
        {
            existingPicAlert(title: "Replace Current Picture?", message: "By continuing, you will overwrite your current motivation picture.")
        }
    }
    
    @IBAction func removePhoto(_ sender: Any) {
//        let data: Data? = nil
//        UserDefaults.standard.set(data, forKey: "myImageKey")
        deleteAlert(title: "Remove Picture", message: "This will remove your picture and clear all scheduled reminders. If you want to replace your picture instead and keep your scheduled times, click 'Upload Picture'")
    }
    
    func deleteAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            let data: Data? = nil
            UserDefaults.standard.set(data, forKey: "myImageKey")
            self.checkPhotoUploadStatus()
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            self.checkPhotoUploadStatus()
        }))
        
        self.present(alert,animated:true)
        
    }
    
    func existingPicAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Replace", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            self.uploadPhoto()
            self.checkPhotoUploadStatus()
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
            self.checkPhotoUploadStatus()
        }))
        
        self.present(alert,animated:true)
    }
    
    func uploadPhoto() {
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
}


extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let pickedImage = rotateImage(image: image)
            let data = pickedImage.pngData()
            UserDefaults.standard.set(data, forKey: "myImageKey")
            UserDefaults.standard.synchronize()
        }
        self.checkPhotoUploadStatus()
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



