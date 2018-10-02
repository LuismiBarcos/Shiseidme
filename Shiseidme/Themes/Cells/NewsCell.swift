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
    @IBOutlet weak var newsDescription: UILabel!
    
    func render(imageEntry: ImageEntry) {
        image.lr_setImageWithURL(
            URL(string: imageEntry.imageUrl)!,
            placeholderImage: nil,
            optionsInfo: [.backgroundDecode])
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 3
        image.contentMode = .scaleAspectFill
        
        newsDescription.text = imageEntry.description
    }
}
