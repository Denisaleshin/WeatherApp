//
//  TTInitialViewController.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/9/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import UIKit
import CoreLocation

class TTInitialViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let intermediateVK = TTIntermediateViewController(nibName: "TTIntermediateViewController", bundle: nil)
        navigationController?.pushViewController(intermediateVK, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
    }
    
   
}

extension TTInitialViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        nextButton.isEnabled = true
        if let location = locations.first {
            print(location.coordinate)
            
        }
    }
}
