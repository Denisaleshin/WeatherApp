//
//  TTLoadingViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit
import CoreLocation

class TTLoadingViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(downloadingFinished), name: dataFetched, object: nil)
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    @objc func downloadingFinished(notification: NSNotification) {
        guard let weatherInfo = notification.userInfo as? [String: String] else { return }
        let weatherVC = TTWeatherViewController(nibName: "TTWeatherViewController", bundle: nil)
        navigationController?.pushViewController(weatherVC, animated: true)
    }
    
}

extension TTLoadingViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        if let location = locations.first {
            print(location.coordinate)
           
            
            
            }
        }
    }

