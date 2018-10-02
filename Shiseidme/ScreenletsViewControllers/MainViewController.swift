//
//  File.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens
import iOSPhotoEditor

class FakeViewController: UIViewController {

}

class MainViewController:
    UITabBarController,
    UITabBarControllerDelegate,
    ImageGalleryScreenletDelegate {

    let emptyGalleryScreenlet = ImageGalleryScreenlet(frame: .zero, themeName: "shiseidme")
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
		tabBar.tintColor = .black
        delegate = self

        emptyGalleryScreenlet.presentingViewController = self
        emptyGalleryScreenlet.folderId = 72155
        emptyGalleryScreenlet.repositoryId = 20143
        emptyGalleryScreenlet.delegate = self
        
        let newsVC = NewsViewController()
        newsVC.tabBarItem = self.createTabBarItem(
            tag: 1,
            image: "news_disabled",
            selectedImage: "news_enabled")
        
		let feedVC = AdvertisementsViewController()
		feedVC.tabBarItem = self.createTabBarItem(
            tag: 2,
            image: "advertisements_disabled",
            selectedImage: "advertisements_enabled")
        
        let cameraVC = FeedViewController()
        cameraVC.tabBarItem = self.createTabBarItem(
            tag: 3,
            image: "social_disabled",
            selectedImage: "social_disabled")

		let userProfileVC = ChatViewController()
        userProfileVC.tabBarItem = self.createTabBarItem(
            tag: 4,
            image: "chat-disabled",
            selectedImage: "chat-enabled")

		viewControllers = [newsVC, feedVC, cameraVC ,userProfileVC]
        self.tabBar.barTintColor = UIColor.white
		addLogo()
        addRightBarButtonItems()
        disableSocialButtons()
	}
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.tag == 3 ? self.enableSocialButtons() : self.disableSocialButtons()
    }

	@objc func goToUserProfile() {
		self.navigationController?.pushViewController(UserProfileViewController(), animated: true)
	}
    
    @objc func uploadNewImage() {
        self.showMediaSelectorAndPhotoEditor()
    }
    
    private func addRightBarButtonItems() {
        navigationItem.rightBarButtonItems = [
            self.createBarButtonItem(imageName: "plus-button", selector: #selector(uploadNewImage)),
            self.createBarButtonItem(imageName: "profile_enabled", selector: #selector(goToUserProfile))]
    }
    
    private func createBarButtonItem(imageName: String, selector: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(
            image: UIImage(named: imageName),
            style: .plain,
            target: self,
            action: selector)
        
    }
    
    private func createTabBarItem(tag: Int, image: String, selectedImage: String) -> UITabBarItem{
        let defaultTabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: image),
            selectedImage: UIImage(named: selectedImage))
        defaultTabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        defaultTabBarItem.tag = tag
        return defaultTabBarItem
    }
    
    private func disableSocialButtons() {
        navigationItem.rightBarButtonItems?.forEach({item in
            item.isEnabled = false
            item.tintColor = UIColor.clear
        })
    }
    
    private func enableSocialButtons() {
        navigationItem.rightBarButtonItems?.forEach({item in
            item.isEnabled = true
            item.tintColor = UIColor.black
        })
    }

	fileprivate func addLogo() {
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		let image = UIImage(named: "logo.gif")
		imageView.image = image
		navigationItem.titleView = imageView
	}
    
    // MARK: ImageGalleryScreenletDelegate methods
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploaded image: ImageEntry) {
        let a = CommentAddInteractor.init(
            className: "com.liferay.document.library.kernel.model.DLFileEntry",
            classPK: image.imageEntryId,
            body: image.description)
        _ = a.start()

        a.onSuccess = {
            print("añadido")
        }

        a.onFailure = { error in
            print("Fallo al añadir el comentatio \(error)")
        }
    }
    
    // MARK
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is FakeViewController {
            self.showMediaSelectorAndPhotoEditor()
            return false
        }
        return true
    }
}
