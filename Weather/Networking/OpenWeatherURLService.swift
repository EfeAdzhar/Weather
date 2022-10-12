//
//  URL.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import UIKit

final class OpenWeatherURLService {
    
    public final func formateWeatherTemperature(_ temp : Double) -> String {
        let celsium = String.init(format: "%.2f", temp - 273.15)
        return celsium
    }

    public final func dateFormation(_ date : Int, _ timezone : Int, _ backgroundView : UIImageView) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.long
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        let localDate = dateFormatter.string(from: date)
        BackgroundSetUp(backgroundView).dayTime(localDate)
        return localDate
    }
}
