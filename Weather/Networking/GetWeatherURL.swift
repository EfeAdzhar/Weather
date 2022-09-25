//
//  URL.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import UIKit

final class GetWeatherURL {
    
    private final let urlString : String
    private final let url : URL
    private final let urlSession : URLSession
    
    public init(urlString : String, url : URL, urlSession : URLSession) {
        self.urlString = urlString
        self.url = url
        self.urlSession = urlSession
    }
    
    public init(city : String) {
        let privateConstants = PrivateConstants()
        urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(privateConstants.getAPIKey())"
        url = URL(string: urlString)!
        urlSession = URLSession(configuration: .default)
    }
    
    public final func fetchCurrentWeather(_ cityName: UILabel, _ temperature: UILabel, _ date : UILabel, _ backgroundView : UIImageView) {
        urlSession.dataTask(with: url) { data, urlResponse, error in
            if let data = data {
                self.inputJSON(withData: data, cityName, temperature, date, backgroundView)
                print("responce status: \(String(describing: Responce().responseStatus(200)))")
            } else {
                print("responce status: \(String(describing: Responce().responseStatus(404)))")
            }
        }.resume()
    }
    
    private final func parseJSON(withData data: Data) -> CurrentWeatherDate? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherDate.self, from: data)
            return currentWeatherData
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    private final func inputJSON(withData data : Data, _ cityName: UILabel, _ temperature: UILabel, _ date : UILabel, _ backgroundView : UIImageView) {
        let currentWeatherData = self.parseJSON(withData: data)
        DispatchQueue.main.async {
            cityName.text = currentWeatherData?.name
            temperature.text = self.formateWeatherTemperature(currentWeatherData) + " °C"
            date.text = self.dateFormation(currentWeatherData!.dt, currentWeatherData!.timezone, backgroundView)
        }
    }
    
    private final func formateWeatherTemperature(_ currentWeatherData : CurrentWeatherDate?) -> String {
        let celsium = String.init(format: "%.2f", (currentWeatherData!.main.temp) - 273.15)
        return celsium
    }
    
    private final func dateFormation(_ date : Int, _ timezone : Int, _ backgroundView : UIImageView) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.long
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        let localDate = dateFormatter.string(from: date)
        print(localDate)
        DayTimeSetUp(backgroundView).dayTime(localDate)
        return localDate
    }
}
