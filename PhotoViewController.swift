//
//  PhotoViewController.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 5/27/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

struct Quote{
    var quote: String!
    var author: String!
}

class PhotoViewController: UIViewController {

    var Quotes = [Quote]()
    
    var QuoteID = Int()

    @IBOutlet weak var picta: UIImageView!
    
    @IBOutlet weak var displayQuote: UILabel!
    
    @IBOutlet weak var displayAuthor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Uploaded Photo from UserDefaults
        if let imageData = UserDefaults.standard.data(forKey: "myImageKey"){
            self.picta.image = UIImage(data: imageData)
        }
        
        //Fill Motivational Quotes
        Quotes = [Quote(quote: "Don't be afraid to give up the good to go for the great.", author: "John D. Rockefeller"),Quote(quote: "Work hard in silence, let your success be your noise.", author: "Frank Ocean")]
        
        PickQuote()
    }
    
    func PickQuote(){
        
        QuoteID = Int.random(in: 0..<Quotes.count)
        
        displayQuote.text = Quotes[QuoteID].quote
        
        displayAuthor.text = "-" + Quotes[QuoteID].author
        
    }

}

