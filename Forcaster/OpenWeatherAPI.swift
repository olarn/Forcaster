//
//  OpenWeatherAPI.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol OpenWeatherAPIProtocol {
    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback)
}

 let apiKey = "<<YOUR API KEY>>"

class OpenWeatherAPI: OpenWeatherAPIProtocol {

    let restClient: RestClientProtocol

    init(restClient: RestClientProtocol) {
        self.restClient = restClient
    }

    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback) {
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        restClient.get(urlString: url) { data in
            guard let json = data else {
                result(Weather.empty)
                return
            }
            let emptyWeather = Weather.empty
            result(
                Weather(
                    cityName: json["name"].string ?? emptyWeather.cityName,
                    temperature: json["main"]["temp"].int ?? emptyWeather.temperature,
                    humidity: json["main"]["humidity"].int ?? emptyWeather.humidity,
                    icon: iconNameToChar(icon: json["weather"][0]["icon"].string ?? "e")))
        }
    }
}
