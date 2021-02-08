//
//  ViewController.swift
//  Home Time
//
//  Created by Jason van Lint on 7/2/21.
//

import UIKit

class TramTimeTableViewController: UIViewController {

    @IBOutlet weak var northTableView: UITableView!
    @IBOutlet weak var southTableView: UITableView!
    let northTableData = NorthTramStopDataSource()
    let southTableData = SouthTramStopDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add icon to navbar title
        let logo = UIImage(named: "logo.pdf")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit // set imageview's content mode
        self.navigationItem.titleView = imageView

        northTableView.delegate = northTableData
        northTableView.dataSource = northTableData

        southTableView.delegate = southTableData
        southTableView.dataSource = southTableData
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        retrieveTramData()
        }

    @IBAction func didTapRefresh(_ sender: Any) {
        retrieveTramData()

    }

    func retrieveTramData() {
        northTableData.retrieveNorthStopInfo { [weak self] in
             self?.northTableView.reloadData()
        }
        southTableData.retrieveSouthStopInfo { [weak self] in
            self?.southTableView.reloadData()
        }
    }

}
