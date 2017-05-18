//
//  SearchWeatherViewController.swift
//  Forcaster
//
//  Created by Olarn U. on 5/18/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import UIKit

class SearchWeatherViewController: UIViewController {

    @IBOutlet weak var searchCityName: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    var presenter: SearchWeatherPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewPresenter()
        prepareSearchCallback()
        searchCityName.delegate = self
    }

}

// MARK: -

extension SearchWeatherViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchCityName.resignFirstResponder()
        presenter.search(city: textField.text ?? "")
        return true
    }

}

extension SearchWeatherViewController {

    fileprivate func prepareViewPresenter() {
        let restClient = RestClient()
        let weatherApi = OpenWeatherAPI(restClient: restClient)
        self.presenter = SearchWeatherPresenter(weatherApi: weatherApi)
    }

    fileprivate func prepareSearchCallback() {
        presenter.searchCityWetherCallback = { weather in
            self.cityLabel.text = weather.cityName
            self.tempLabel.text = "\(weather.temperature)"
            self.humidityLabel.text = "\(weather.humidity)"
            self.iconLabel.text = weather.icon
        }
    }

}
