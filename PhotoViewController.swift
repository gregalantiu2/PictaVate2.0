//
//  PhotoViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 5/27/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {


    @IBOutlet weak var picta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageData = UserDefaults.standard.data(forKey: "myImageKey"){
            self.picta.image = UIImage(data: imageData)
        }
    }
    
    

}

