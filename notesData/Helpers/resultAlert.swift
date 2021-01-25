//
//  resultAlert.swift
//  notesData
//
//  Created by bhargava on 25/01/21.
//

import UIKit
extension UIViewController{
    func checkDetails(){
        let alert = UIAlertController.init(title: "Error", message: "Check the Detailss", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

