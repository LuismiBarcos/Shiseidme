//
//  MainViewControllerExtensions.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 12/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import iOSPhotoEditor
import LiferayScreens

extension MainViewController: PhotoEditorDelegate {
    
    func showMediaSelectorAndPhotoEditor() {
        if let viewController = emptyGalleryScreenlet.presentingViewController {
            
            let takeNewPicture = LocalizedString("default",
                                                 key: "userportrait-take-new-picture",
                                                 obj: self)
            let chooseExisting = LocalizedString("default",
                                                 key: "userportrait-choose-existing-picture",
                                                 obj: self)
            
            let cancelText = LocalizedString("imagegallery-screenlet", key: "cancel", obj: self)
            
            let alert = MediaSelector(
                viewController: viewController,
                types: [
                    .camera: takeNewPicture,
                    .image: chooseExisting
                ],
                cancelMessage: cancelText) { (image, _) in
                    
                    guard let image = image else {
                        return
                    }
                    
                    self.showPhotoEditor(image)
            }
            alert.show()
        }
    }
    
    private func showPhotoEditor(_ image: UIImage) {
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self
        photoEditor.image = image
        //Colors for drawing and Text, If not set default values will be used
        //photoEditor.colors = [.red, .blue, .green]
        
        //Stickers that the user will choose from to add on the image
        for i in 0...10 {
            photoEditor.stickers.append(UIImage(named: i.description )!)
        }
        
        //To hide controls - array of enum control
        photoEditor.hiddenControls = [.save]
        self.present(photoEditor, animated: true, completion: nil)
    }
    
    // MARK photoEditorProtocol
    
    func doneEditing(image: UIImage) {
        let imageUpload = ImageEntryUpload(image: image, title: "")
        emptyGalleryScreenlet.showDetailUploadView(imageUpload)
    }
    
    func canceledEditing() {
        print("Canceled")
    }
}


