//
//  FeedCell.swift
//  Shiseidme
//
//  Created by Victor Galan on 02/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import UIKit
import LiferayScreens

class FeedCell: UICollectionViewCell, AssetDisplayScreenletDelegate {

	@IBOutlet weak var ratingScreenlet: RatingScreenlet!
	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var timeAgoLabel: UILabel!
	@IBOutlet weak var assetDisplayScreenlet: AssetDisplayScreenlet!

    override func awakeFromNib() {
        super.awakeFromNib()

		backgroundColor = .white
		layer.cornerRadius = 3

		assetDisplayScreenlet.delegate = self
		assetDisplayScreenlet.autoLoad = false
		ratingScreenlet.autoLoad = false
    }

	func screenlet(_ screenlet: AssetDisplayScreenlet, onAsset asset: Asset) -> UIView? {
		let userView = UserView()
		let object = asset.attributes["object"] as! [String: AnyObject]

		userView.user = User(attributes: object["user"] as! [String: AnyObject])
		return userView
	}

	func screenlet(_ screenlet: AssetDisplayScreenlet, onAssetError error: NSError) {

	}

	func render(imageEntry: ImageEntry) {
		let createDate = Date(millisecondsSince1970: Double(imageEntry.attributes["createDate"]?.int64Value ?? 0))

		image.lr_setImageWithURL(
			URL(string: imageEntry.imageUrl)!,
			placeholderImage: nil,
			optionsInfo: [.backgroundDecode])

		timeAgoLabel.text = createDate.timeAgo

		descriptionLabel.text = imageEntry.attributes["description"] as? String ?? ""

		ratingScreenlet.classPK = imageEntry.attributes["fileEntryId"]?.int64Value ?? 0
		ratingScreenlet.className = "com.liferay.document.library.kernel.model.DLFileEntry"
		ratingScreenlet.loadRatings()

		assetDisplayScreenlet.classPK = imageEntry.attributes["userId"]?.int64Value ?? 0
		assetDisplayScreenlet.className = "com.liferay.portal.kernel.model.User"
		assetDisplayScreenlet.load()
	}
}
