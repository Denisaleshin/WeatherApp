//
//  Weather.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation

class TTWeather: Decodable {
    
    private var farengeitTemperature: Double
    
    var cityName: String?
    
    var temperature:String {
        get {
            let temp = round(farengeitTemperature)
            return "\(temp - farengeitToCelsiusTransitionRate)"
        }
    }
        
    
    
    enum CodingKeys: String, CodingKey {
        case currently
    }
    
    enum CurentlyCodingKeys: String, CodingKey {
        case temperature = "temperature"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let curentlyContainer = try container.nestedContainer(keyedBy: CurentlyCodingKeys.self, forKey: .currently)
        self.farengeitTemperature = try curentlyContainer.decode(Double.self, forKey: .temperature)
    }
    
}
