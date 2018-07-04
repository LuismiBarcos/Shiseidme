//
//  UserView.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class UserView: UIView {

	@IBOutlet weak var userPortraitScreenlet: UserPortraitScreenlet?
	@IBOutlet weak var usernameLabel: UILabel?

	var user: User? {
		didSet {
			if userPortraitScreenlet?.userId != user!.userId {
				userPortraitScreenlet?.load(userId: user!.userId)
			}
			usernameLabel?.text = "\(user!.firstName) \(user!.lastName)"
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	fileprivate func setup() {
		userPortraitScreenlet?.autoLoad = false

		let nib = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)
		if let view = nib?.last as? UIView {
			self.addSubview(view)

			view.translatesAutoresizingMaskIntoConstraints = false

			//Pin all edges from Screenlet View to the Screenlet's edges
			let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
										 toItem: self, attribute: .top, multiplier: 1, constant: 0)
			let bottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
											toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
			let leading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal,
											 toItem: self, attribute: .leading, multiplier: 1, constant: 0)
			let trailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
											  toItem: self, attribute: .trailing, multiplier: 1, constant: 0)

			NSLayoutConstraint.activate([top, bottom, leading, trailing])
		}
	}
}
