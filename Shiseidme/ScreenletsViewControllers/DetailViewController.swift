//
//  DetailViewController.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 03/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class DetailViewController: XibViewController, FileDisplayScreenletDelegate, CommentListScreenletDelegate, CommentAddScreenletDelegate {
    
    @IBOutlet weak var imageScreenlet: ImageDisplayScreenlet!
    
    @IBOutlet weak var commentListScreenlet: CommentListScreenlet!
    
    @IBOutlet weak var commentAddScreenlet: CommentAddScreenlet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScreenlet.delegate = self
        imageScreenlet.assetEntryId = 34716
        
        commentListScreenlet.delegate = self
        commentListScreenlet.className = "com.liferay.blogs.model.BlogsEntry"
        commentListScreenlet.classPK = 33295
        
        commentAddScreenlet.delegate = self
        commentAddScreenlet.className = "com.liferay.blogs.model.BlogsEntry"
        commentAddScreenlet.classPK = 33295
    }
    
    // MARK: FileDisplayScreenletDelegate methods
    
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetResponse url: URL) {
//        self.showAlert(title: "File received")
    }
    
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetError error: NSError) {
        self.showAlert(title: "Error")
    }
    
    // MARK: CommentListScreenletDelegate methods
    
    func screenlet(_ screenlet: CommentListScreenlet, onListResponseComments comments: [Comment]) {
//        self.showAlert(title: "Comments received")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onCommentListError error: NSError) {
        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onSelectedComment comment: Comment) {
        print("Comment selected")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onDeletedComment comment: Comment) {
        self.showAlert(title: "Comment deleted")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onCommentDelete comment: Comment, onError error: NSError) {
        print("Commen prepare to be delete")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onUpdatedComment comment: Comment) {
        self.showAlert(title: "Comment updated")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onCommentUpdate comment: Comment, onError error: NSError) {
        print("Comment prepare for update")
    }
    
    // MARK: CommentAddScreenletDelegate
    
    func screenlet(_ screenlet: CommentAddScreenlet, onCommentAdded comment: Comment) {
        self.showAlert(title: "Comment added")
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onAddCommentError error: NSError) {
        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onCommentUpdated comment: Comment) {
        print("Comment prepare for update")
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onUpdateCommentError error: NSError) {
        self.showAlert(title: "Error updating the comment")
    }
}
