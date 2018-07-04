//
//  CommentListView_shiseido.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 03/07/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import LiferayScreens

class CommentListView_shiseidme: CommentListView_default {
    
    let cellId = "CommentTableViewCell_shiseidme"
    
    override func doGetCellId(row: Int, object: AnyObject?) -> String {
        return cellId
    }
    
    override func doRegisterCellNibs() {
        let uiNib = UINib(nibName: cellId, bundle: nil)
        tableView?.register(uiNib, forCellReuseIdentifier: cellId)
    }
}
