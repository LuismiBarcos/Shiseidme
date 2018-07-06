//
//  File.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class FakeViewController: ImageUploadDetailViewController_default {
    
    override func startUploadClick() {
        self.imageUploadDetailview?.startUpload()
        dismiss(animated: true)
    }
}

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    let prueba = ImageGalleryScreenlet(frame: .zero, themeName: "shiseidme")
    
	override func viewDidLoad() {
		super.viewDidLoad()

		tabBar.tintColor = .black
        delegate = self

        prueba.presentingViewController = self
        prueba.folderId = 72155
        prueba.repositoryId = 20143
        
        
		let feedVC = FeedViewController()
		let feedTabBarItem = UITabBarItem(
			title: nil,
			image: UIImage(named: "feed_disabled"),
			selectedImage: UIImage(named: "feed_enabled"))

		feedTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
		feedVC.tabBarItem = feedTabBarItem
        
    
        let imageUploadDetailview = ImageUploadDetailViewBase()
        let cameraVC = FakeViewController(imageUploadDetailview: imageUploadDetailview)
        let cameraTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "plus-button"), selectedImage: UIImage(named: "plus-button"))
        cameraTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        cameraVC.tabBarItem = cameraTabBarItem

		let userProfileVC = UserProfileViewController()

		let profileTabBarItem = UITabBarItem(
			title: nil,
			image: UIImage(named: "profile_disabled"),
			selectedImage: UIImage(named: "profile_enabled"))

		profileTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

		userProfileVC.tabBarItem = profileTabBarItem

		viewControllers = [feedVC, cameraVC ,userProfileVC]

		let chatButton = UIBarButtonItem(image: UIImage(named: "chat"), style: .plain, target: self, action: #selector(goToChat))
		navigationItem.rightBarButtonItem = chatButton

		addLogo()
	}

	@objc func goToChat() {
		let chatVC = ChatViewController()
		self.navigationController?.pushViewController(chatVC, animated: true)
	}

	fileprivate func addLogo() {
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		let image = UIImage(named: "logo.gif")
		imageView.image = image
		navigationItem.titleView = imageView
	}
    
    // MARK
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is FakeViewController {
            prueba.startMediaSelectorAndUpload()
            
            
            return false
        }
        return true
    }
}
