//
//  File.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let feedVC = FeedViewController()
		let userProfileVC = UserProfileViewController()

		feedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
		userProfileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)

		viewControllers = [feedVC, userProfileVC]
	}
}
