//
//  dataCell.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//

import UIKit

class dataCell: UITableViewCell {
    @IBOutlet weak var backroundView:UIView!
    @IBOutlet weak var rowLabel : UILabel!
    @IBOutlet weak var dataLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var bcView:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
