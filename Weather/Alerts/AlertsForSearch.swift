//
//  AlertsForSearch.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import UIKit

class AlertsForSearch {
    private final let nameOfACity: UILabel
    private final let temperature: UILabel
    private final let date : UILabel
    private final let backgroundView : UIImageView
    
    init(_ nameOfACity : UILabel, _ temperature: UILabel, _ date : UILabel, _ backgroundView : UIImageView) {
        self.nameOfACity = nameOfACity
        self.temperature = temperature
        self.date = date
        self.backgroundView = backgroundView
    }
    
    public func alertControllerForSearcher(_ rootVC : UIViewController, _ title : String, _ message : String, _ preferredStyle : UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let actionSearch = UIAlertAction(title: "Search", style: .default) { [self] _ in
            
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else {return}
            
            if(cityName != "") {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                GetWeatherURL(city: city).fetchCurrentWeather(nameOfACity, temperature, date, backgroundView)
            }
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        
        alert.addAction(actionSearch)
        alert.addAction(actionCancel)
        alert.addTextField()
        
        rootVC.present(alert, animated: true)
    }
}
