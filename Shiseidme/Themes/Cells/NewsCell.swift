//
//  NewsCell.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 01/10/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var overlay: UIView!
    @IBOutlet weak var newsDescription: UILabel!
    
    func render(imageEntry: ImageEntry) {
        image.lr_setImageWithURL(
            URL(string: imageEntry.imageUrl)!,
            placeholderImage: nil,
            optionsInfo: [.backgroundDecode])
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 30
        
        overlay.layer.cornerRadius = 30
        overlay.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        newsDescription.text = imageEntry.description
    }
}
