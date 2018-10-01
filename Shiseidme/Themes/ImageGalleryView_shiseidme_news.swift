//
//  ImageGalleryView_shiseidme_news.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 01/10/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class ImageGalleryView_shiseidme_news: ImageGalleryView_default {
    let numberOfColumns = 1
    let cellId = "newsCell"
    
    override var columnNumber: Int {
        get {
            return numberOfColumns
        }
        set {}
    }
    
    override func onCreated() {
        super.onCreated()
        
        let grayColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)

        backgroundColor = grayColor
        collectionView?.backgroundColor = grayColor
    }
    
    
    override func doGetCellId(indexPath: IndexPath, object: AnyObject?) -> String {
        return cellId
    }
    
    override func doRegisterCellNibs() {
        let uiNib = UINib(nibName: "NewsCell", bundle: nil)
        
        collectionView?.register(uiNib, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        
        return CGSize(width: width - 20, height: 400)
    }
    
    override func doCreateLayout() -> UICollectionViewLayout {
        let layout = super.doCreateLayout() as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 10.0
        
        
        return layout
    }
    
    override func doFillLoadedCell(indexPath: IndexPath, cell: UICollectionViewCell, object: AnyObject) {
        let imageEntry = object as! ImageEntry
        let cell = cell as! NewsCell
        cell.layer.cornerRadius = 3
        cell.render(imageEntry: imageEntry)
    }
    
    override func setRows(_ allRows: [String : [AnyObject?]], newRows: [String : [AnyObject]], rowCount: Int, sections: [String]) {
        let defaultSection = allRows[BaseListView.DefaultSection] as! [ImageEntry?]
        let userImageEntries = defaultSection.compactMap{ $0 }.sorted { $0.attributes["createDate"]!.int64Value > $1.attributes["createDate"]!.int64Value }
        let userImageRows = [BaseListView.DefaultSection:userImageEntries]
        super.setRows(userImageRows, newRows: userImageRows, rowCount: userImageEntries.count, sections: sections)
    }
}
