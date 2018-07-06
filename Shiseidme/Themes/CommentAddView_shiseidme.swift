//
//  CommentAddView_shiseidme.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 03/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class CommentAddView_shiseidme: CommentAddView_default {
    
    
    @IBOutlet weak var userPortraitScreenlet: UserPortraitScreenlet!
    
    override func onShow() {
        super.onShow()
        userPortraitScreenlet.load(userId: (SessionContext.currentContext?.user.userId)!)
    }
    
    
    override func onCreated() {
        super.onCreated()
        layer.borderWidth = 1
        let alpha = CGFloat(0.3)
        let borderColor =  UIColor.gray
        layer.borderColor = borderColor.withAlphaComponent(alpha).cgColor
        
        sendCommentButton?.backgroundColor = nil
    }
    
    override func updateButton() {
        self.sendCommentButton?.isEnabled = !(addCommentTextField?.text?.isEmpty ?? false)

        if let sendCommentButton = sendCommentButton {
            sendCommentButton.tintColor =
                sendCommentButton.isEnabled ? UIColor.blue :
                UIColor.blue.withAlphaComponent(0.3)
        }
    }
}
