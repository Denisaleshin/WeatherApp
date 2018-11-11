//
//  Extentions.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation

extension URLResponse {
    
    func validate(_ response: URLResponse?) throws {
        guard let response = response as? HTTPURLResponse else {
            throw HTTPSEror.invalidResponse
        }
        guard let status = HTTPStatusCode(rawValue: response.statusCode) else {
            throw HTTPSEror.invalidStatusCode
        }
        if !status.isSuccessful {
            throw HTTPSEror.requestFailed(statusCode: status.rawValue, message: status.message)
        }
    }
}
