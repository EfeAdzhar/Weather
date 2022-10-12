//
//  MainViewControllerLogic.swift
//  Weather
//
//  Created by Efe on 06.10.2022.
//

import Foundation
import PromiseKit

final class WeatherViewControllerLogic {
    
    private var delegate : WeatherViewControllerDelegate
    
    init(_ delegate : WeatherViewControllerDelegate) {
        self.delegate = delegate
    }
    
    func fetchURL(url: String) -> Promise<CurrentWeatherDate> {
       return self.delegate.fetch(url: url)
    }
    
    func inputDataIntoJSON() {
        
    }
}
