//
//  URL.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation

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
    
    public final func fetchCurrentWeather() {
        urlSession.dataTask(with: url) { data, urlResponse, error in
            if let data = data {
                self.parseJSON(withData: data)
                print(Responce().responseStatus(200), " status")
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
}
