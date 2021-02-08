//
//  TramStopTableViewCell.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import UIKit

class TramStopTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblFromNow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
