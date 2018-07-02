//
//  LoadingViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class LoadingViewController: XibViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SessionContext.loadStoredCredentials()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showLogin()
    }
    
    private func showLogin() {
		let nextVC = SessionContext.isLoggedIn ? UserProfileViewController() : LoginViewController()
		let navigationController = UINavigationController(rootViewController: nextVC)

		self.present(navigationController, animated: true, completion: nil)
    }
}
