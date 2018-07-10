//
//  SignUpView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 10/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class SignUpView_shiseidme: SignUpView_default {
    
    override func onCreated() {
        super.onCreated()
        signUpButton?.isEnabled = true
        signUpButton?.backgroundColor = UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1)
        
        signUpButton?.titleLabel?.textColor = UIColor.white
    }
    
}
