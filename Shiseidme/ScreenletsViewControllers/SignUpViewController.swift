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
        screenlet.anonymousApiUserName = "anonymous1@liferay.com"
        screenlet.anonymousApiPassword = "anonymous1"
    }
    
    //MARK: SignUpScreenletDelegate
    
    func screenlet(_ screenlet: SignUpScreenlet, onSignUpResponseUserAttributes attributes: [String: AnyObject]) {
        let nextVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: nextVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func screenlet(_ screenlet: SignUpScreenlet, onSignUpError error: NSError) {
        showAlert(title: "Error")
    }
}
