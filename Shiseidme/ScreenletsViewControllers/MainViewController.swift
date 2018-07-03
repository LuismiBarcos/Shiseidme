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

		tabBar.tintColor = .black

		let feedVC = FeedViewController()
		let feedTabBarItem = UITabBarItem(
			title: nil,
			image: UIImage(named: "feed_disabled"),
			selectedImage: UIImage(named: "feed_enabled"))

		feedTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
		feedVC.tabBarItem = feedTabBarItem


		let userProfileVC = UserProfileViewController()

		let profileTabBarItem = UITabBarItem(
			title: nil,
			image: UIImage(named: "profile_disabled"),
			selectedImage: UIImage(named: "profile_enabled"))

		profileTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

		userProfileVC.tabBarItem = profileTabBarItem

		viewControllers = [feedVC, userProfileVC]
	}
}
