//
//  OpenWeatherAPI.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import Foundation
import SwiftyJSON

/// The api key to communicate with openweathermap.org
/// Create you own on https://home.openweathermap.org/users/sign_up

fileprivate let apiKey = "<<YOUR API KEY>>"

class OpenWeatherAPI: OpenWeatherAPIProtocol, OpenWeatherForcastAPIProtocol {

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

    func weatherForcastFor(cityName: String, result: @escaping ForcastWeatherCallback) {

        //TODO: code here...

        // API Docs Here...
        // https://openweathermap.org/forecast16

        // API Example here ... 
        // http://samples.openweathermap.org/data/2.5/forecast/daily?q=Bangkok&appid=b1b15e88fa797225412429c1c50c122a1
    }
}
