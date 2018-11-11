//
//  TTRequestBuilder.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation
import CoreLocation

class TTRequestBuilder  {
    
    var path: String
    var location: CLLocation?
    
    init(path: String, location: CLLocation?) {
        self.path = path
        self.location = location
    }
    
    
    func buildRequest() -> URLRequest? {
        guard let coordinates = location else { return nil}
        let latitude = "\(Double(coordinates.coordinate.latitude))"
        let longitude = "\(Double(coordinates.coordinate.longitude))"
        let urlString = path + latitude + "," + longitude
        let optionaUrl = URL(string: urlString)
        guard let url = optionaUrl else { return nil}
        let request = URLRequest(url: url)
        return request
    }
}
