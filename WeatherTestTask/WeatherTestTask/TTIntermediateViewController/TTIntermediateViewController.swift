//
//  TTIntermediateViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit

class TTIntermediateViewController: UIViewController {
    
    var isDataDownloaded = false
    var weatherModel: TTWeather?
    
    @IBAction func okButonTapped(_ sender: Any) {
        if isDataDownloaded {
            let weatherVC = TTWeatherViewController(nibName: "TTWeatherViewController", bundle: nil)
            weatherVC.weatherModel = weatherModel
            navigationController?.pushViewController(weatherVC, animated: true)
        } else {
            let loadingVC = TTLoadingViewController(nibName: "TTLoadingViewController", bundle: nil)
            navigationController?.pushViewController(loadingVC, animated: true)
        }
    }
    
    @objc func downloadingFinished(notification: Notification) {
        guard let weatherInfo = notification.userInfo as? [String: TTWeather] else { return }
        isDataDownloaded = true
        weatherModel = weatherInfo[notificationUserInfoKey]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(downloadingFinished), name: dataFetched, object: nil)
        print("Observer added")
    }
    
}
