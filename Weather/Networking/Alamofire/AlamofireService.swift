//
//  AlamofireService.swift
//  Weather
//
//  Created by Efe on 06.10.2022.
//

import Foundation
import Alamofire
import PromiseKit

final class AlamofireService {
    
    public func getData(url : String) -> Promise<CurrentWeatherDate> {
        return Promise { seal in
        AF.request(url, method: .get).validate()
            .responseDecodable(of: CurrentWeatherDate.self) { response in
                do {
                    let name = try response.result.get().name
                    let dt =  try response.result.get().dt
                    let timezone =  try response.result.get().timezone
                    let weather = try response.result.get().weather
                    let main =  try response.result.get().main
                    let currentWeatherDate = CurrentWeatherDate(name: name, main: main, weather: weather, timezone: timezone, dt: dt)
                    seal.fulfill(currentWeatherDate)
                    debugPrint("response status:",response.response?.statusCode ?? "error in status code")
                } catch {
                    seal.reject(response.error!)
                    debugPrint("response status:",response.response?.statusCode ?? "error in status code")
                }
            }
        }
    }
}
//MARK: GUIDE
//                switch (response.result) {
//                case .success(let currentWeatherDataVariables):
//                    let currentWeatherDate = CurrentWeatherDate(name: currentWeatherDataVariables.name,
//                                                                main: currentWeatherDataVariables.main,
//                                                                weather: currentWeatherDataVariables.weather,
//                                                                timezone: currentWeatherDataVariables.timezone,
//                                                                dt: currentWeatherDataVariables.dt)
//                         seal.fulfill(currentWeatherDate)
                //  debugPrint("response status:",response.response?.statusCode ?? "error in status code")
//                case .failure(_):
//                    seal.reject(response.error!)
                //  debugPrint("response status:",response.response?.statusCode ?? "error in status code")
//                }
