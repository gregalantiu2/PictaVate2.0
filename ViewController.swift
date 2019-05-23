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

