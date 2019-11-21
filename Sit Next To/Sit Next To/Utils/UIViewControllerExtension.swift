//
//  UIViewControllerExtension.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/21/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(withTitle title: String, message: String, cancelActionTitle: String) {
        let okAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
