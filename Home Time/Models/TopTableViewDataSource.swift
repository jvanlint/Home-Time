//
//  NorthTramStopDataSource.swift
//  Home Time
//
//  Created by Jason van Lint on 8/2/21.
//

import Foundation
import UIKit



/// Calls the API, retireves data and populates class variables that store the resulting data for the North tram stop table view.
class TopTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    /// The class var that stores the results from the API call to populate a table.
    private var data: [Date]

    /// The API client used to make calls to the Tram Tracker API.
    private let tramTrackerAPIClient = TramTrackerAPI()

    override init() {
        self.data = [Date(), Date().addingTimeInterval(600)]
        super.init()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "northTramStopCell", for: indexPath) as! TramStopTableViewCell

        let tramDate = data[indexPath.row]                                                                  // Get the tram date.

        cell.configureLabels(tramTime: tramDate, row: indexPath.row)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Code for when the cell is tapped. Present a alert view controller.
    }

    func retrieveNorthStopInfo(completion: @escaping (() -> Void)) {

        self.data.removeAll()

        tramTrackerAPIClient.fetchTramStopInfo(stop: 4055, line: 78) { result in
            switch result {
            case .success(let response):
                for item in response.responseObject {
                    if let tramDate = item.predictedArrivalDateTime.dateFromDotNetFormattedDateString(){
                        self.data.append(tramDate)
                    }
                }
                completion()
                print(response)
            default:
                print("error \(result)")

            }
        }
    }

    func clearNorthTramStopData() {
        self.data.removeAll()
    }

}
