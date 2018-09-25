//
//  IconNameToChar.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import Foundation

private let iconChars = [
    "01d": "\u{f11b}",
    "01n": "\u{f110}",
    "02d": "\u{f112}",
    "02n": "\u{f104}",
    "03d": "\u{f111}",
    "03n": "\u{f111}",
    "04d": "\u{f111}",
    "04n": "\u{f111}",
    "09d": "\u{f116}",
    "09n": "\u{f116}",
    "10d": "\u{f113}",
    "10n": "\u{f113}",
    "11d": "\u{f10d}",
    "11n": "\u{f10d}",
    "13d": "\u{f119}",
    "13n": "\u{f119}",
    "50d": "\u{f10e}",
    "50n": "\u{f10e}"
]

public func iconNameToChar(icon: String) -> String {
    guard let char = iconChars[icon] else {
        return "E"
    }
    return char
}
