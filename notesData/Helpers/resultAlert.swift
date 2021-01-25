//
//  resultAlert.swift
//  notesData
//
//  Created by bhargava on 25/01/21.
//

import UIKit
extension UIViewController{
    func checkDetails(alertTitle : String,message : String , actionTitle : String){
        let alerts = UIAlertController.init(title: alertTitle  , message: message, preferredStyle: .alert)
        alerts.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: nil))
        present(alerts, animated: true, completion: nil)
    }
    func checkingDetails(){
        
    }
}

