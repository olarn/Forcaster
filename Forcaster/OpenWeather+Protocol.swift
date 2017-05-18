//
//  OpenWeather+Protocol.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

typealias SearchWeatherCallback = ((Weather) -> Void)
typealias ForcastWeatherCallback = (([DailyWeather]) -> Void)

protocol OpenWeatherAPIProtocol {
    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback)
}

protocol OpenWeatherForcastAPIProtocol {
    func weatherForcastFor(cityName: String, result: @escaping ForcastWeatherCallback)
}
