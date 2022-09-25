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
}

struct Main : Decodable {
    let temp : Double
    let feelsLike : Double
    
    enum CodingKeys : String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct WeatherElement : Decodable {
    let id : Int
}
