//
//  SearchWeatherPresenter.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

typealias SearchWeatherCallback = ((Weather) -> Void)

class SearchWeatherPresenter {

    let api: OpenWeatherAPIProtocol
    var searchCityWetherCallback: SearchWeatherCallback?

    init(weatherApi: OpenWeatherAPIProtocol) {
        self.api = weatherApi
    }

    func search(city cityName: String) {
        guard let callback = self.searchCityWetherCallback else {
            return
        }
        if cityName == "" {
            callback(Weather.empty)
        }
        api.searchWeatherByCity(city: cityName) { weather in
            callback(weather)
        }
    }
}
