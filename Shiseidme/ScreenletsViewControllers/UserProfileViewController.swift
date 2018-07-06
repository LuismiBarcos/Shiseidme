//
//  UserProfileViewController.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class UserProfileViewController: XibViewController, UserPortraitScreenletDelegate, ImageGalleryScreenletDelegate, FileDisplayScreenletDelegate {

    @IBOutlet weak var userPortraitScreenlet: UserPortraitScreenlet!
    @IBOutlet weak var imageGalleryScreenlet: ImageGalleryScreenlet!
    @IBOutlet weak var backImageDisplayScreenlet: ImageDisplayScreenlet!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = SessionContext.currentContext?.user.firstName
        email.text = SessionContext.currentContext?.user.email
        
        userPortraitScreenlet.delegate = self
        userPortraitScreenlet.presentingViewController = self
        userPortraitScreenlet.autoLoad = false
        userPortraitScreenlet.editable = true
        userPortraitScreenlet.loadLoggedUserPortrait()
        
        imageGalleryScreenlet.delegate = self
		imageGalleryScreenlet.folderId = 72155
		imageGalleryScreenlet.repositoryId = 20143
        
        backImageDisplayScreenlet.delegate = self
        backImageDisplayScreenlet.classPK = 72458
		backImageDisplayScreenlet.className = "com.liferay.document.library.kernel.model.DLFileEntry"
    }
    
    // MARK: UserPortraitScreenletDelegate methods
    
    func screenlet(_ screenlet: UserPortraitScreenlet, onUserPortraitResponseImage image: UIImage) -> UIImage {
//        self.showAlert(title: "Image received")
        return image
    }
    
    func screenlet(_ screenlet: UserPortraitScreenlet, onUserPortraitError error: NSError) {
//        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: UserPortraitScreenlet, onUserPortraitUploaded attributes: [String: AnyObject]) {
//        self.showAlert(title: "Image uploaded")
    }
    
    func screenlet(_ screenlet: UserPortraitScreenlet, onUserPortraitUploadError error: NSError) {
//        self.showAlert(title: "Error in upload")
    }
    
    // MARK: ImageGalleryScreenletDelegate methods
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntriesResponse imageEntries: [ImageEntry]) {
//        self.showAlert(title: "Web content received")
        
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntriesError error: NSError) {
//        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntrySelected imageEntry: ImageEntry) {
        let viewController = DetailViewController(imageClassPK: imageEntry.imageEntryId)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntryDeleted imageEntry: ImageEntry) {
//        self.showAlert(title: "Image deleted")
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageEntryDeleteError error: NSError) {
//        self.showAlert(title: "Error deleting image")
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
//        self.showAlert(title: "An error occurs in the upload process")
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploaded image: ImageEntry) {
//        self.showAlert(title: "Image upload finished")
    }
    
    func screenlet(_ screenlet: ImageGalleryScreenlet, onImageUploadDetailViewCreated view: ImageUploadDetailViewBase) -> Bool {
        print("Image upload viw is instantiated")
        return true
    }
    
    // MARK: ImageDisplayScreenletDelegate methods
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetResponse url: URL) {
//        self.showAlert(title: "File received")
    }
    
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetError error: NSError) {
//        self.showAlert(title: "Error")
    }
}
