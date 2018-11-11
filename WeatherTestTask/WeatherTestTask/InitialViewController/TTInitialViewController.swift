//
//  TTInitialViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TTInitialViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    lazy var dataManager:TTDataManager = {
        let locService = TTLocationService()
        let requestBuilder = TTRequestBuilder(path: darkSkyServicePath, location: currentLocation)
        let networkService = TTNetworkService(requestBuilder: requestBuilder)
        let dataManager = TTDataManager(locationService: locService, networkService: networkService)
        return dataManager
    }()
    
    @IBOutlet weak var nextButton: UIButton!

    @IBAction func nextButtonTapped(_ sender: Any) {
        let intermediateVK = TTIntermediateViewController(nibName: "TTIntermediateViewController", bundle: nil)
        navigationController?.pushViewController(intermediateVK, animated: true)
        dataManager.fetch(currentLocation)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location
    }
}

extension TTInitialViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        nextButton.isEnabled = true
        manager.stopUpdatingLocation()
    }
}

