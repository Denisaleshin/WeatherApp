//
//  TTIntermediateViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit

let dataFetched = Notification.Name(rawValue: "dataFetched")

class TTIntermediateViewController: UIViewController {

    var isDataDownloaded = false
    var weatherDictionary: [String: String]?
    
    @IBAction func okButonTapped(_ sender: Any) {
        
        if isDataDownloaded {
            let weatherVC = TTWeatherViewController(nibName: "TTWeatherViewController", bundle: nil)
            weatherVC.weatherInfo = weatherDictionary 
            navigationController?.pushViewController(weatherVC, animated: true)
        } else {
            let loadingVC = TTLoadingViewController(nibName: "TTLoadingViewController", bundle: nil)
            navigationController?.pushViewController(loadingVC, animated: true)
        }
        
    }
    
    @objc func downloadingFinished(notification: Notification) {
        guard let weatherInfo = notification.userInfo as? [String: String] else { return }
        isDataDownloaded = true
        weatherDictionary = weatherInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(downloadingFinished), name: dataFetched, object: nil)
    }

    
}
