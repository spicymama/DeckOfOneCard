//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Gavin Woffinden on 5/4/21.
//

import UIKit


extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
    
    
}
