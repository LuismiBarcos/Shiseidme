//
//  ImageUploadDetailView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 06/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class ImageUploadDetailView_shiseidme: ImageUploadDetailView_default {
    
    override var righButton: UIBarButtonItem? {
        didSet{
            self.righButton?.isEnabled = false
        }
    }
    
    override func initialize() {
        super.initialize()
        self.righButton?.isEnabled = false
    }
    
    override func textViewDidEndEditing(_ textView: UITextView) {
        super.textViewDidEndEditing(textView)
        if textView.text.isEmpty {
            self.righButton?.isEnabled = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.righButton?.isEnabled = false
        } else {
            self.righButton?.isEnabled = true
        }
    }
}
