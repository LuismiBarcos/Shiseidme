//
//  AppDelegate.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	
    func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		let loadingVC = LoadingViewController()
		let navigationController = UINavigationController(rootViewController: loadingVC)

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

		UINavigationBar.appearance().tintColor = .black

        return true
    }
}

