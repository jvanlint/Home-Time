//
//  NorthTramStopDataSource.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import Foundation
import UIKit


class NorthTramStopDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var data: [String]

    override init() {
        self.data = ["2:14", "2:19", "3:01"]
        super.init()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "northTramStopCell", for: indexPath) as! TramStopTableViewCell
        let item = data[indexPath.row]
        cell.lblTime.text = item
        return cell
    }

}
