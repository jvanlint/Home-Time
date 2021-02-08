//
//  ViewController.swift
//  Home Time
//
//  Created by Jason van Lint on 7/2/21.
//

import UIKit

class TramTimeTableViewController: UIViewController {

    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!

    /// Datasource and delgate object variable for the top tableview
    let topTableData = NorthTramStopDataSource()

    /// Datasource and delgate object variable for the bottom tableview
    let bottomTableData = SouthTramStopDataSource()


    // MARK:- View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add icon to navbar title
        let logo = UIImage(named: "logo.pdf")                   // Set a logo for the navbar instead of title text.
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView

        topTableView.delegate = topTableData                    // Set the delgate and datasource for the top table in the view
        topTableView.dataSource = topTableData

        bottomTableView.delegate = bottomTableData              // Set the delgate and datasource for the bottom table in the view
        bottomTableView.dataSource = bottomTableData
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retrieveTramData()
    }

    // MARK:- Nav Button Bar Interaction Methods

    @IBAction func didTapRefresh(_ sender: Any) {
        retrieveTramData()                                      // Refresh data by making another call to the API and reload tableviews.
    }

    @IBAction func didTapClear() {
        topTableData.clearNorthTramStopData()                   // Clear any data in the arrays feeding the table.
        bottomTableData.clearSouthTramStopData()
        self.topTableView.reloadData()                          // Reload each table
        self.bottomTableView.reloadData()
    }

    // MARK:- Table View Refresh Methods


    /// Calls a function in the datasource class for each table and reloads the tableview when data has been received.
    func retrieveTramData() {
        topTableData.retrieveNorthStopInfo { [weak self] in
            self?.topTableView.reloadData()
        }

        bottomTableData.retrieveSouthStopInfo { [weak self] in
            self?.bottomTableView.reloadData()
        }
    }

}
