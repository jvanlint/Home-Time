//
//  ViewController.swift
//  Home Time
//
//  Created by Jason van Lint on 7/2/21.
//

import UIKit

class TramTimeTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add icon to navbar title
        let logo = UIImage(named: "logo.pdf")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit // set imageview's content mode
        self.navigationItem.titleView = imageView

        
    }


}

