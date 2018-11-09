//
//  TTLoadingViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit

class TTLoadingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(downloadingFinished), name: dataFetched, object: nil)
    }
    
    @objc func downloadingFinished(notification: NSNotification) {
        guard let weatherInfo = notification.userInfo as? [String: String] else { return }
        let weatherVC = TTWeatherViewController(nibName: "TTWeatherViewController", bundle: nil)
        weatherVC.weatherInfo = weatherInfo
        navigationController?.pushViewController(weatherVC, animated: true)
    }
    
}
