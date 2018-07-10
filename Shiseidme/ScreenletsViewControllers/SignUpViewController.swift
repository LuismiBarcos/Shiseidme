//
//  SignUpViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 10/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens
class SignUpViewController: UIViewController, SignUpScreenletDelegate {
    @IBOutlet weak var screenlet: SignUpScreenlet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenlet.delegate = self
    }
    
    //MARK: SignUpScreenletDelegate
    
    func screenlet(_ screenlet: SignUpScreenlet, onSignUpResponseUserAttributes attributes: [String: AnyObject]) {
        showAlert(title: "Sign up complete")
    }
    
    func screenlet(_ screenlet: SignUpScreenlet, onSignUpError error: NSError) {
        showAlert(title: "Error")
    }
}
