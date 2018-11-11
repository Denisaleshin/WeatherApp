//
//  TTNetworkService.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation
import CoreLocation

class TTNetworkService {
    
    var requestBuilder: TTRequestBuilder
    var jsonDecoder: JSONDecoder
    var currentTask: URLSessionDataTask?
    
    init(requestBuilder: TTRequestBuilder, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.requestBuilder = requestBuilder
        self.jsonDecoder = jsonDecoder
    }
    
    func getWeatherData(_ completion: @escaping(_ weather:TTWeather?, _ error: Error?) -> ()) {
        guard let request = requestBuilder.buildRequest() else { return }
        currentTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                try response?.validate(response)
                let weather :TTWeather = try self.jsonDecoder.decode(TTWeather.self, from: data)
                completion(weather, nil )
            } catch {
                completion(nil, error)
            }
            
        }
        currentTask?.resume()
    }
}

