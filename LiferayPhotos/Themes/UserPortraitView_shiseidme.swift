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

