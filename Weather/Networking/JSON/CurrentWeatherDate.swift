//
//  JSON.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation

struct CurrentWeatherDate : Decodable {
    let name : String
    let main : Main
    let weather: [WeatherElement]
    let timezone : Int
    let dt: Int
}

struct Main : Decodable {
    let temp : Double
}

struct WeatherElement : Decodable {
    let id : Int
}
