//
//  TTWeatherViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit

class TTWeatherViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var weatherModel: TTWeather?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let weatherModel = weatherModel {
            let degrees: String = weatherModel.temperature
            let city = weatherModel.cityName ?? "we could not determine where are you from"
            textLabel.text = "\(degrees) degrees in \(city)"
        } else {
            textLabel.text = "sorry something gone wrong"
        }
    }

   

}
