 //
//  FeedViewController.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class FeedViewController: XibViewController, ImageGalleryScreenletDelegate {

	@IBOutlet weak var screenlet: ImageGalleryScreenlet!

	override func viewDidLoad() {
		super.viewDidLoad()
		screenlet.delegate = self
		screenlet.folderId = 54469
		screenlet.repositoryId = 20143
	}

	override func viewDidAppear(_ animated: Bool) {
//		self.showLogin()
	}

	private func showLogin(){
		if !SessionContext.isLoggedIn {
			self.performSegue(withIdentifier: "LoginViewController", sender: nil)
		}
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntriesResponse imageEntries: [ImageEntry]) {
		//        self.showAlert(title: "Web content received")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntriesError error: NSError) {
		self.showAlert(title: "Error")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntrySelected imageEntry: ImageEntry) {
		print("item selected")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntryDeleted imageEntry: ImageEntry) {
		self.showAlert(title: "Image deleted")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntryDeleteError error: NSError) {
		self.showAlert(title: "Error deleting image")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploadStart imageEntryUpload: ImageEntryUpload) {
		print("image prepared to be upload")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet,
				   onImageUploadProgress imageEntryUpload: ImageEntryUpload,
				   totalBytesSent: UInt64,
				   totalBytesToSend: UInt64) {
		print("Upload progress change")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploadError error: NSError) {
		self.showAlert(title: "An error occurs in the upload process")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploaded image: ImageEntry) {
		self.showAlert(title: "Image upload finished")
	}

	func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploadDetailViewCreated view: ImageUploadDetailViewBase) -> Bool {
		print("Image upload viw is instantiated")
		return true
	}
}
