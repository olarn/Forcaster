//
//  SearchWeatherTests.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Forcaster

class FakeOpenWeatherAPI: OpenWeatherAPIProtocol {
    func searchWeatherByCity(city: String, result: @escaping SearchWeatherCallback) {
        result(
            Weather(
                cityName: "Bangkok",
                temperature: 30,
                humidity: 70,
                icon: "")
        )
    }
}

class FakeRestClient: RestClientProtocol {

    func get(urlString: String, callback: @escaping (_ data: JSON?) -> Void) {
        callback(
            JSON([
                "name": "Bangkok",
                "main": [
                    "temp": 30,
                    "humidity": 70],
                "weather": [["icon": "e"]]]
            )
        )
    }
}

class SearchWeatherTests: XCTestCase {

    func testSearchBangkokOverPresenterShouldReturnBangkokWeather() {

        let expected = expectation(description: "Search Bangkok Should Return Bangkok's Weather")

        let weatherPresenter = SearchWeatherPresenter(weatherApi: FakeOpenWeatherAPI())
        weatherPresenter.searchCityWetherCallback = { weather in
            XCTAssertTrue(weather.cityName == "Bangkok")
            XCTAssertTrue(weather.temperature == 30)
            XCTAssertTrue(weather.humidity == 70)
            expected.fulfill()
        }
        weatherPresenter.search(city: "Bangkok")

        waitForExpectations(timeout: 1) { error in
            if let err = error {
                XCTFail(err.localizedDescription)
            }
        }
    }

    func testSearchBangkokOverOpenWeatherAPIShouldReturnBangkokWeather() {
        let expected = expectation(description: "Search Bangkok Over OpenWeatherAPI Should Return Bangkok's Weather")

        let openWeatherAPI = OpenWeatherAPI(restClient: FakeRestClient())
        openWeatherAPI.searchWeatherByCity(city: "Bangkok") { weather in
            XCTAssertTrue(weather.cityName == "Bangkok")
            XCTAssertTrue(weather.temperature == 30)
            XCTAssertTrue(weather.humidity == 70)
            expected.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let err = error {
                XCTFail(err.localizedDescription)
            }
        }
    }

}
