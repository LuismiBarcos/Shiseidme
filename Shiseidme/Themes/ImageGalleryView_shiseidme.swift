//
//  ImageGalleryView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class ImageGalleryView_shiseidme: ImageGalleryView_default {
    
    let NUMBER_OF_COLUMNS = 1
    
    override var columnNumber: Int {
        get {
            return NUMBER_OF_COLUMNS
        }
        set {}
    }
}
