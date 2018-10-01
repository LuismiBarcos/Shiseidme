//
//  NewsViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 01/10/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class NewsViewController: XibViewController, ImageGalleryScreenletDelegate {

    @IBOutlet weak var screenlet: ImageGalleryScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenlet.delegate = self
        screenlet.folderId = 98422
        screenlet.repositoryId = 20143
        screenlet.themeName = "shiseidme_news"
    }
    
    // MARK: ImageGalleryScreenletDelegate methods
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntrySelected imageEntry: ImageEntry) {
        print("item selected")
//        let viewController = DetailViewController(imageClassPK: imageEntry.imageEntryId)
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
