//
//  LoginView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 09/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class LoginView_shiseidme: LoginView_default, UITextFieldDelegate {
    
    let blueColor = UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1)
    
    @IBOutlet weak var signUpView: UIView!
    @IBAction func signUpButton(_ sender: UIButton) {
        let viewController = SignUpViewController()
        self.screenlet?.presentingViewController?
                    .navigationController?
                    .pushViewController(viewController, animated: true)
    }
    
    override func onCreated() {
        super.onCreated()
        setBorderInSignUp()
        setLeftImageToPasswordField()
        userNameField?.delegate = self
        passwordField?.delegate = self
        disableLoginButton()
    }
    
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        if oneFieldIsEmpty(){
            disableLoginButton()
        } else {
            enableLoginButton()
        }
    }
    
    // MARK: private methods
    
    private func disableLoginButton() {
        loginButton?.isEnabled = false
        loginButton?.backgroundColor = UIColor.white
        loginButton?.layer.borderWidth = 1
        loginButton?.layer.borderColor = blueColor.cgColor
        loginButton?.titleLabel?.textColor = blueColor
        loginButton?.alpha = 0.5
    }
    
    private func enableLoginButton() {
        loginButton?.isEnabled = true
        loginButton?.alpha = 1
        loginButton?.layer.borderWidth = 0
        loginButton?.backgroundColor = blueColor
        loginButton?.titleLabel?.textColor = UIColor.white
    }
    
    private func oneFieldIsEmpty() -> Bool {
        return (userNameField?.text?.isEmpty)! || (passwordField?.text?.isEmpty)!
    }
    
    private func setBorderInSignUp(){
        let topBorderView = UIView(frame: CGRect.zero)
        topBorderView.backgroundColor = UIColor.black
        signUpView.addSubview(topBorderView)
        topBorderView.translatesAutoresizingMaskIntoConstraints = false
        topBorderView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topBorderView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topBorderView.bottomAnchor.constraint(equalTo: self.signUpView.topAnchor).isActive = true
        topBorderView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setLeftImageToPasswordField() {
        let imageView = UIImageView();
        let image = Bundle.imageInBundles(name: "default-lock-icon", currentClass: type(of: self))
        imageView.image = image;
        (passwordField as? DefaultTextField)?.leftImage = image
    }
}
