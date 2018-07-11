//
//  SignUpView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 10/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class SignUpView_shiseidme: SignUpView_default, UITextFieldDelegate {
    
    let blueColor = UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1)
    
    override func onCreated() {
        super.onCreated()
        firstNameField?.delegate = self
        lastNameField?.delegate = self
        emailAddressField?.delegate = self
        passwordField?.delegate = self
    }
    
    override func onShow() {
        super.onShow()
        disableSignUpButton()
    }
    
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        if oneFieldIsEmpty(){
            disableSignUpButton()
        } else {
            enableSignUpButton()
        }
    }
    
    private func oneFieldIsEmpty() -> Bool {
        return (firstNameField?.text?.isEmpty)!
            || (lastNameField?.text?.isEmpty)!
            || (emailAddressField?.text?.isEmpty)!
            || (passwordField?.text?.isEmpty)!
    }
    
    private func disableSignUpButton() {
        signUpButton?.isEnabled = false
        signUpButton?.backgroundColor = UIColor.white
        signUpButton?.layer.borderWidth = 1
        signUpButton?.layer.borderColor = blueColor.cgColor
        signUpButton?.titleLabel?.textColor = blueColor
        signUpButton?.alpha = 0.5
    }
    
    private func enableSignUpButton() {
        signUpButton?.isEnabled = true
        signUpButton?.alpha = 1
        signUpButton?.layer.borderWidth = 0
        signUpButton?.backgroundColor = blueColor
        signUpButton?.titleLabel?.textColor = UIColor.white
    }
}
