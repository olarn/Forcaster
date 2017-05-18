//
//  OpenWeatherAPI.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation
import SwiftyJSON

/// The api key to communicate with openweathermap.org
/// Create you own on https://home.openweathermap.org/users/sign_up

// fileprivate let apiKey = "<<YOUR API KEY>>"
fileprivate let apiKey = "80ee9ef64a3e3b1725545ea3e6f9553b"
typealias SearchWeatherCallback = ((Weather) -> Void)

protocol OpenWeatherAPIProtocol {
    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback)
}

class OpenWeatherAPI: OpenWeatherAPIProtocol {

    let restClient: RestClientProtocol

    init(restClient: RestClientProtocol) {
        self.restClient = restClient
    }

    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback) {

        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        restClient.get(urlString: url) { data in

            let emptyWeather = Weather.empty
            guard let json = data else {
                result(emptyWeather)
                return
            }

            result(
                Weather(
                    cityName: json["name"].string ?? emptyWeather.cityName,
                    temperature: json["main"]["temp"].int ?? emptyWeather.temperature,
                    humidity: json["main"]["humidity"].int ?? emptyWeather.humidity,
                    icon: iconNameToChar(icon: json["weather"][0]["icon"].string ?? "e")))
        }
    }
}
