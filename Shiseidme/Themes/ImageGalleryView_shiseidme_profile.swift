/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
import UIKit
import LiferayScreens

class ImageGalleryView_shiseidme_profile: ImageGalleryView_default {

	override var columnNumber: Int {
		get {
			return 3
		}
		set {}
	}
    
    override func doCreateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let cellWidth = screenlet!.bounds.width / CGFloat(columnNumber) - spacing
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        return layout
    }

}
