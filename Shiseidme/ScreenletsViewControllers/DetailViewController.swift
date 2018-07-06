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
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var imageClassPK: Int64?
    
    convenience init(imageClassPK: Int64) {
        self.init()
        self.imageClassPK = imageClassPK
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScreenlet.delegate = self
        commentListScreenlet.className = "com.liferay.document.library.kernel.model.DLFileEntry"
        imageScreenlet.classPK = imageClassPK ?? 0
        imageScreenlet.imageMode = .scaleAspectFill
        
        commentListScreenlet.delegate = self
        commentListScreenlet.className = "com.liferay.document.library.kernel.model.DLFileEntry"
        commentListScreenlet.classPK = imageClassPK ?? 0
        
        commentAddScreenlet.delegate = self
        commentAddScreenlet.className = "com.liferay.document.library.kernel.model.DLFileEntry"
        commentAddScreenlet.classPK = imageClassPK ?? 0
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { notification in
            self.keyboardWillAppear(notification)
        }
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: nil) { notification in
            self.keyboardWillDisappear(notification)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func keyboardWillAppear(_ notification: Notification){
        let bottomConstraint = self.getKeyboardHeight(notification)
        let duration = self.getKeyboardAnimationDuration(notification)
        self.animateAddCommentView(bottomConstraint, duration)
    }
    
    private func keyboardWillDisappear(_ notification: Notification){
        let duration = self.getKeyboardAnimationDuration(notification)
        self.animateAddCommentView(0, duration)
    }
    
    private func animateAddCommentView(_ bottomConstraint: CGFloat, _ duration: Double) {
        self.bottomConstraint.constant = -bottomConstraint
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardFrame.cgRectValue.height
    }
    
    private func getKeyboardAnimationDuration(_ notification: Notification) -> Double {
        return notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
    }
    
    // MARK: FileDisplayScreenletDelegate methods
    
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetResponse url: URL) {
//        self.showAlert(title: "File received")
    }
    
    func screenlet(_ screenlet: FileDisplayScreenlet, onFileAssetError error: NSError) {
//        self.showAlert(title: "Error")
    }
    
    // MARK: CommentListScreenletDelegate methods
    
    func screenlet(_ screenlet: CommentListScreenlet, onListResponseComments comments: [Comment]) {
//        self.showAlert(title: "Comments received")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onCommentListError error: NSError) {
//        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onSelectedComment comment: Comment) {
        print("Comment selected")
    }
    
    func screenlet(_ screenlet: CommentListScreenlet, onDeletedComment comment: Comment) {
//        self.showAlert(title: "Comment deleted")
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

    
        commentListScreenlet.viewModel?.addComment(comment)
//        commentListScreenlet.loadList()
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onAddCommentError error: NSError) {
//        self.showAlert(title: "Error")
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onCommentUpdated comment: Comment) {
        print("Comment prepare for update")
    }
    
    func screenlet(_ screenlet: CommentAddScreenlet, onUpdateCommentError error: NSError) {
        self.showAlert(title: "Error updating the comment")
    }
}
