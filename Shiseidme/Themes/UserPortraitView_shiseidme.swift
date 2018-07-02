//
//  UserPortraitView_userProfile.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class UserPortraitView_shiseidme: UserPortraitView_default {
    
    override func onShow() {
        super.onShow()
        
        self.portraitImage?.layer.cornerRadius = self.portraitImage!.frame.size.width / 2
        self.portraitImage?.clipsToBounds = true
        self.borderWidth = 0.0
        self.editButton?.layer.cornerRadius = self.editButton!.frame.size.width / 2
        
        self.screenlet?.backgroundColor = .clear
    }
}

