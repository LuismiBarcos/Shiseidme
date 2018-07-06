//
//  CommentDisplayView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 04/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class CommentDisplayView_shiseidme: CommentDisplayView_default {
    
    override func onShow() {
        super.onShow()
    }
    
    override class func heightForText(_ text: String?, width: CGFloat) -> CGFloat {
        let height = super.heightForText(text, width: width)
        return height - 40
    }
}
