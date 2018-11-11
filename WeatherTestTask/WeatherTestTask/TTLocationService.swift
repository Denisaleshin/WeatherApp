//
//  TTLocationService.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class TTLocationService {
    
    var geocoder: CLGeocoder
    
    init(geocoder: CLGeocoder = CLGeocoder()) {
        self.geocoder = geocoder
    }
    
    func  getCityName(_ location: CLLocation, completion: @escaping(_ cityName:String?, _ error: Error?) -> ())  {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (plaseMarks, error) in
            if let error = error {
                completion(nil, error)
            } else {
                guard let plaseMark = plaseMarks?.first else { return }
                let locationName = plaseMark.locality
                completion(locationName, nil)
            }
        }
    }
    
}
