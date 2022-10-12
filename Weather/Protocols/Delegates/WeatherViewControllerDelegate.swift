//
//  WeatherViewControllerDelegate.swift
//  Weather
//
//  Created by Efe on 09.10.2022.
//

import Foundation
import PromiseKit

protocol WeatherViewControllerDelegate {
    func fetch(url: String) -> Promise<CurrentWeatherDate>
}
