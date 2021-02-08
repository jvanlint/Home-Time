//
//  NorthTramStopDataSource.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import Foundation
import UIKit


class SouthTramStopDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var data: [String]

    override init() {
        self.data = ["3:14", "3:19", "4:01"]
        super.init()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "southTramStopCell", for: indexPath) as! TramStopTableViewCell
        let item = data[indexPath.row]
        cell.lblTime.text = item
        return cell
    }

    func clearSouthTramStopData() {
        self.data.removeAll()
    }
}
