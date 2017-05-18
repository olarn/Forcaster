//
//  Weather.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

struct Weather: Equatable {
    let cityName: String
    let temperature: Int
    let humidity: Int
    let icon: String

    static let empty = Weather(
        cityName: "--",
        temperature: 0,
        humidity: 0,
        icon: iconNameToChar(icon: "e")
    )

    static func ==(lhs: Weather, rhs: Weather) -> Bool{
        return
            lhs.cityName == rhs.cityName &&
            lhs.temperature == rhs.temperature &&
            lhs.humidity == rhs.humidity &&
            lhs.icon == rhs.icon
    }

}
