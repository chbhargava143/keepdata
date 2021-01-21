//
//  detailVc.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//

import UIKit

class detailVc: UIViewController {
    var getData = Notedata()
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var dataLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "E,d MM yyyy,HH:mm:ss a"
        dataLabel.text = getData.createdata
        if let date = getData.createdate {
            let dateString = formatter.string(from: date)
            dateLabel.text = dateString
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
