//
//  LoadingViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SessionContext.loadStoredCredentials()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showLogin()
    }
    
    private func showLogin(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            !SessionContext.isLoggedIn
            ? storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            : storyBoard.instantiateViewController(withIdentifier: "ImageGalleryViewController") as! ImageGalleryViewController
        self.present(viewController as UIViewController, animated: true, completion: nil)
    }
}
