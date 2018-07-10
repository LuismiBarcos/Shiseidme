//
//  LoginViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class LoginViewController: XibViewController, LoginScreenletDelegate {

    @IBOutlet weak var screenlet: LoginScreenlet!

    override func viewDidLoad() {
        super.viewDidLoad()
        screenlet.delegate = self
        screenlet.saveCredentials = true
        screenlet.presentingViewController = self
    }
    
    func screenlet(_ screenlet: BaseScreenlet, onLoginResponseUserAttributes attributes: [String : AnyObject]) {
        let vc = MainViewController()

		let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
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
