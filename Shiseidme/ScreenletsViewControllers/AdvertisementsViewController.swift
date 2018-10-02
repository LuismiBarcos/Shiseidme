//
//  AdversitmentsViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 02/10/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class AdvertisementsViewController: UIViewController, ImageGalleryScreenletDelegate {

    @IBOutlet weak var screenlet: ImageGalleryScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenlet.delegate = self
        screenlet.folderId = 98536
        screenlet.repositoryId = 20143
        screenlet.themeName = "shiseidme_news"
    }
}
