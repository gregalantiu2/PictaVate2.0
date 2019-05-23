//
//  PictaModel.swift
//  Pictavate2.0
//
//  Created by Greg Tiu on 5/22/19.
//  Copyright © 2019 Greg Tiu. All rights reserved.
//

import UIKit

class PictaModel{
    let id: UUID
    var times: [String]?
    var image: UIImage?
    
    init(image:UIImage? = nil){
        id = UUID()
    }
}
