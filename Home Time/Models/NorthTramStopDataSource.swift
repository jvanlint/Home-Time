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
        self.data = [Date(), Date().addingTimeInterval(600)]
        super.init()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "northTramStopCell", for: indexPath) as! TramStopTableViewCell
        let tramDate = data[indexPath.row]
        let minutes = Calendar.current.dateComponents([.minute], from: Date() , to: tramDate).minute ?? 0
        cell.lblTime.text = tramDate.timeIn24HourFormat()
        if minutes < 2 {
            cell.lblFromNow.text = "\(minutes) minute from now."
        } else {
            cell.lblFromNow.text = "\(minutes) minutes from now."
        }
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.systemGray6
        }else{
            cell.backgroundColor = UIColor.white
        }
        
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
