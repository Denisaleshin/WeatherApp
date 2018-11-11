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
    
    var shouldFetchData = false
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    lazy var dataManager:TTDataManager = {
        let locService = TTLocationService()
        let requestBuilder = TTRequestBuilder(path: darkSkyServicePath, location: currentLocation)
        let networkService = TTNetworkService(requestBuilder: requestBuilder)
        let dataManager = TTDataManager(locationService: locService, networkService: networkService)
        return dataManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(downloadingFinished), name: dataFetched, object: nil)
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location
        
        if shouldFetchData {
           dataManager.fetch(currentLocation)
        }
    }
    
    @objc func downloadingFinished(notification: NSNotification) {
        guard let weatherInfo = notification.userInfo as? [String: TTWeather] else { return }
        let weatherVC = TTWeatherViewController(nibName: "TTWeatherViewController", bundle: nil)
        weatherVC.weatherModel = weatherInfo[notificationUserInfoKey]
        navigationController?.pushViewController(weatherVC, animated: true)
    }
    
}

extension TTLoadingViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
    }
    
}

