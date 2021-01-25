//
//  detailVc.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//

import UIKit
import CoreData
class detailVc: UIViewController {
    let results = ResultDeclare.onSuccess
    var getData = Notedata()
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var dataLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
      
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "E,d MM yyyy,HH:mm:ss a"
        switch results {
        case .onSuccess:
            dataLabel.text = getData.createdata
            if let date = getData.createdate {
                let dateString = formatter.string(from: date)
                dateLabel.text = dateString
            }
            break
        case .onFailure:
            checkDetails(alertTitle: "Error", message: "Check details", actionTitle: "Ok")
            print("ShowDetails failure Error")
            break
        default:
            checkDetails(alertTitle: "Error", message: "Check details", actionTitle: "Ok")
            print("ShowDetails default Error")
            break
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
      }


}
