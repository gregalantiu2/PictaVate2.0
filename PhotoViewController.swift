//
//  PhotoViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 5/27/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var objQuotes = Quotes()
    
    @IBOutlet weak var picta: UIImageView!
    
    @IBOutlet weak var displayQuote: UILabel!
    
    @IBOutlet weak var displayAuthor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Uploaded Photo from UserDefaults
        if let imageData = UserDefaults.standard.data(forKey: "myImageKey"){
            self.picta.image = UIImage(data: imageData)
        }
        
        objQuotes.PickQuote(displayQuote: displayQuote,displayAuthor: displayAuthor)
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

    }

    @IBAction func photoScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
}

