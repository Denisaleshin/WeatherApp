//
//  Helpers.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/11/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation
let notificationUserInfoKey = "dataModel"
let farengeitToCelsiusTransitionRate: Double = 32
let dataFetched = Notification.Name(rawValue: "dataFetched")
let darkSkyServicePath = "https://api.darksky.net/forecast/1cc8984b14e52efb28372ad15cca9300/"
typealias JSON = Dictionary<String,Any>

enum HTTPSEror: Error {
    case invalidResponse
    case invalidStatusCode
    case requestFailed(statusCode: Int, message: String)
}

enum HTTPStatusCode: Int {
    case success = 200
    case notFound = 404
    var isSuccessful: Bool {
        return (200..<300).contains(rawValue)
    }
    var message: String {
        return HTTPURLResponse.localizedString(forStatusCode: rawValue)
    }
}
