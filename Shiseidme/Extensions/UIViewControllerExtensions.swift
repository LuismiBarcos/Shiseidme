//
//  UIViewControllerExtensions.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import UIKit
import iOSPhotoEditor

extension UIViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showAlert(title: String) {
        let alert = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func startScreen<T>(screenId: String, T: T.Type){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: screenId) as! T
        //        self.present(viewController as! UIViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController as! UIViewController, animated: true)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        picker.dismiss(animated: true, completion: nil)
        
        
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self as? PhotoEditorDelegate
        photoEditor.image = image
        //Colors for drawing and Text, If not set default values will be used
        //photoEditor.colors = [.red, .blue, .green]
        
        //Stickers that the user will choose from to add on the image
        for i in 0...10 {
            photoEditor.stickers.append(UIImage(named: i.description )!)
        }
        
        //To hide controls - array of enum control
        //photoEditor.hiddenControls = [.crop, .draw, .share]
        
        present(photoEditor, animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
