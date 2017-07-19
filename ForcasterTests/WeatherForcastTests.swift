//
//  WeatherForcastTests.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 AYCAP All rights reserved.
//

import XCTest
@testable import Forcaster

class FakeForcast: OpenWeatherForcastAPIProtocol {
    func weatherForcastFor(cityName: String, result: @escaping ForcastWeatherCallback) {
        result([
            DailyWeather(
                date: "Monday 1, January 2017",
                detail: "sky is clear",
                icon: "e"),
            DailyWeather(
                date: "Tuesday 2, January 2017",
                detail: "rainy",
                icon: "e")
            ])
    }
}

class WeatherForcastTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testWeatherForcastForBangkokShouldReturnBangkokForcast() {

        let expected = expectation(description: "Weather Forcast For Bangkok Should Return Bangkok's Forcast")

        let openWeatherForcastApi = FakeForcast()
        openWeatherForcastApi.weatherForcastFor(cityName: "Bangkok") { weathers in
            XCTAssertTrue(weathers.count == 2)
            expected.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }

    func testWeatherForcastPresenterForBangkokShouldReturnBangkokForcasts() {

        let expected = expectation(description:
            "Weather Forcast Presenter For Bangkok Should Return Bangkok's Forcasts")

        let openWeatherForcastApi = FakeForcast()
        let presenter = DailyForcastTableViewPresenter(forcastApi: openWeatherForcastApi)
        presenter.requestForcastCallback = { weathers in
            XCTAssertTrue(weathers.count == 2)
            expected.fulfill()
        }
        presenter.requestForcastFor(cityName: "Bangkok")

        waitForExpectations(timeout: 1) { error in
            if let e = error {
                XCTFail(e.localizedDescription)
            }
        }
    }

}
