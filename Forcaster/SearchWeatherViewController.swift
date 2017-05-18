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
        prepareWhenSearchCallback()
        searchCityName.delegate = self
    }
}

// MARK: -

extension SearchWeatherViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchCityName.resignFirstResponder()
        presenter.search(city: textField.text ?? "")
        loadingIndicator.startAnimating()
        return true
    }

}

extension SearchWeatherViewController {

    fileprivate func prepareViewPresenter() {
        let restClient = RestClient()
        let weatherApi = OpenWeatherAPI(restClient: restClient)
        presenter = SearchWeatherPresenter(weatherApi: weatherApi)
    }

    fileprivate func prepareWhenSearchCallback() {
        presenter.searchCityWetherCallback = { weather in
            self.loadingIndicator.stopAnimating()
            self.cityLabel.text = weather.cityName
            self.tempLabel.text = "\(weather.temperature) ºC"
            self.humidityLabel.text = "\(weather.humidity)%"
            self.iconLabel.text = weather.icon
        }
    }

}
