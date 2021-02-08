//
//  NorthTramStopDataSource.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import Foundation
import UIKit



class NorthTramStopDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var data: [Date]
    private let tramTrackerAPIClient = TramTrackerAPI()


    override init() {
        self.data = [Date(), Date()]

        super.init()
        //self.retrieveNorthStopInfo()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "northTramStopCell", for: indexPath) as! TramStopTableViewCell
        let item = data[indexPath.row]
        cell.lblTime.text = item.timeIn24HourFormat()
        return cell
    }

    func retrieveNorthStopInfo() {

        self.data.removeAll()

        tramTrackerAPIClient.fetchTramStopInfo(stop: 4055, line: 78) { result in
            switch result {
            case .success(let response):
                for item in response.responseObject {
                    if let tramDate = item.predictedArrivalDateTime.dateFromDotNetFormattedDateString(){
                        self.data.append(tramDate)
                    }
                }
                print(response)
            default:
                print("error \(result)")

            }
        }
    }

}
