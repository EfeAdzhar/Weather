//
//  ViewController.swift
//  Weather
//
//  Created by Efe on 23.09.2022.
//

import UIKit
import Collections
import PromiseKit

final class WeatherViewController: UIViewController {
    
   private var urlString : String?
   private var delegate : WeatherViewControllerLogic?
    
    init(city : String) {
        super.init(nibName: nil, bundle: nil)
        urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(PrivateConstants().getAPIKey())"
        delegate = WeatherViewControllerLogic(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
    
    @IBOutlet private var backgroundView: UIImageView!
    @IBOutlet private var cityName: UILabel!
    @IBOutlet private var temperature: UILabel!
    @IBOutlet private var searchButton: UIButton!
    @IBOutlet private var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func getURL() -> String? {
        return urlString
    }
}

extension WeatherViewController {
    @IBAction private func searchButtonPressed(_ sender: Any) {
        AlertsForSearch()
            .alertControllerForSearcher(self, "Cities", "Type city name", .alert)
    }
}

extension WeatherViewController : WeatherViewControllerDelegate {
    
    public func getDelegate() -> WeatherViewControllerLogic {
        return delegate!
    }
    
    public func fetch(url: String) -> Promise<CurrentWeatherDate> {
        let result =  AlamofireService().getData(url: url)
        
        if(result.isRejected) {
            debugPrint(result.error.debugDescription)
        }
        
        return result.get { [self] currentWeatherDate in
            
            guard temperature != nil, date != nil, cityName != nil else {return}
            
            let openWeatherURLService = OpenWeatherURLService()
            let temp = openWeatherURLService.formateWeatherTemperature(currentWeatherDate.main.temp)
            let date = openWeatherURLService.dateFormation(currentWeatherDate.dt, currentWeatherDate.timezone, self.backgroundView)
    
            self.temperature.text = temp + " °C"
            self.date.text = date
            self.cityName.text = currentWeatherDate.name
        }
    }
}

