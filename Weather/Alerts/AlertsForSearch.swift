//
//  AlertsForSearch.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import UIKit

final class AlertsForSearch {
    
    public func alertControllerForSearcher(_ rootVC : UIViewController, _ title : String, _ message : String, _ preferredStyle : UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let actionSearch = UIAlertAction(title: "Search", style: .default) { _ in
            
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else {return}
            
            if (cityName != "") {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                let weatherViewController = WeatherViewController(city: city)
                let url = weatherViewController.getURL()
                weatherViewController.getDelegate().fetchURL(url: url!)
             // OpenWeatherURLService(city: city).fetchCurrentWeather(nameOfACity)
            }
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        
        alert.addAction(actionSearch)
        alert.addAction(actionCancel)
        alert.addTextField()
        
        rootVC.present(alert, animated: true)
    }
}
