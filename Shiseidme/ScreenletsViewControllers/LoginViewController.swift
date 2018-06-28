//
//  LoginViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class LoginViewController: UIViewController, LoginScreenletDelegate {

    @IBOutlet weak var screenlet: LoginScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenlet.delegate = self
        screenlet.saveCredentials = true
    }
    
    func screenlet(_ screenlet: BaseScreenlet, onLoginResponseUserAttributes attributes: [String : AnyObject]) {
//        self.navigationController?.popToRootViewController(animated: true)
        self.performSegue(withIdentifier: "ImageGalleryViewController", sender: nil)
    }
    
    func screenlet(_ screenlet: BaseScreenlet, onLoginError error: NSError) {
        showAlert(title: "error")
    }
    
    func screenlet(_ screenlet: BaseScreenlet, onCredentialsSavedUserAttributes attributes: [String : AnyObject]) {
        showAlert(title: "credentials saved")
    }
    
    func screenlet(_ screenlet: LoginScreenlet, onCredentialsLoadedUserAttributes attributes: [String : AnyObject]) {
        showAlert(title: "credentials saved")
    }
}
