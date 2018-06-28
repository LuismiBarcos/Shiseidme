//
//  UIViewControllerExtensions.swift
//  Shiseidme
//
//  Created by Luis Miguel Barco on 28/06/2018.
//  Copyright © 2018 Luis Miguel Barco. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
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
}
