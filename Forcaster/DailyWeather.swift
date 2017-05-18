//
//  DailyWeather.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import Foundation

struct DailyWeather: Equatable {
    let date: String
    let detail: String
    let icon: String

    static let empty = DailyWeather(
        date: "--",
        detail: "--",
        icon: iconNameToChar(icon: "e"))

    static func ==(lhs: DailyWeather, rhs: DailyWeather) -> Bool{
        return
            lhs.date == rhs.date &&
            lhs.detail == rhs.detail &&
            lhs.icon == rhs.icon
    }

}
