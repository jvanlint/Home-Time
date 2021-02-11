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

    func configureLabels(tramTime: Date, row: Int) {
        let minutes = Calendar.current.dateComponents([.minute], from: Date() , to: tramTime).minute  ?? 0  // Calculate the minutes between now and tram arrival.

        self.lblTime.text = tramTime.timeIn24HourFormat()

        if minutes < 2 {                                                                                    // Customise message based on time remaining.
            self.lblFromNow.text = "\(minutes) minute from now."
        } else {
            self.lblFromNow.text = "\(minutes) minutes from now."
        }

        if(row % 2 == 0) {                                                                        // Change the bg color of the table to give the appearance of bands.
            self.backgroundColor = UIColor.systemGray6
        }else{
            self.backgroundColor = UIColor.white
        }

    }

}
