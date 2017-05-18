//
//  DailyForcastTableViewPresenter.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import Foundation

class DailyForcastTableViewPresenter {

    let api: OpenWeatherForcastAPIProtocol
    var requestForcastCallback: ForcastWeatherCallback?

    init(forcastApi: OpenWeatherForcastAPIProtocol) {
        self.api = forcastApi
    }

    func requestForcastFor(cityName: String) {
        //TODO: code here...

    }

}
