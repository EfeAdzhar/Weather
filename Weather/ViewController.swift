//
//  ViewController.swift
//  Weather
//
//  Created by Efe on 23.09.2022.
//

import UIKit
import Collections

class ViewController: UIViewController {
    
    @IBOutlet private final weak var backgroundView: UIImageView!
    @IBOutlet private final weak var cityName: UILabel!
    @IBOutlet private final weak var temperature: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var date: UILabel!
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController {
    @IBAction func searchButtonPressed(_ sender: Any) {
        AlertsForSearch(cityName, temperature, date, backgroundView)
            .alertControllerForSearcher(self, "Cities", "Type city name", .alert)
    }
}
