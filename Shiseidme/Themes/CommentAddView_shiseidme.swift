//
//  CommentAddView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 03/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class CommentAddView_shiseidme: CommentAddView_default {
    
    
    @IBOutlet weak var userPortraitScreenlet: UserPortraitScreenlet!
    
    override func onShow() {
        super.onShow()
        userPortraitScreenlet.load(userId: (SessionContext.currentContext?.user.userId)!)
    }
}
