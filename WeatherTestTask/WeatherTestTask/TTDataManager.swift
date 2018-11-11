//
//  DataManager.swift
//  WeatherTestTask
//
//  Created by Dzianis Alioshyn on 11/10/18.
//  Copyright © 2018 Dzianis Alioshyn. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit



class TTDataManager {
    
    var locationService: TTLocationService
    var networkService: TTNetworkService
    
    
    init(locationService: TTLocationService, networkService: TTNetworkService) {
        self.locationService = locationService
        self.networkService = networkService
    }
    
    func fetch(_ location: CLLocation?) {
        guard let curentLocation = location else { return }
        DispatchQueue.global(qos: .background).async {
            self.locationService.getCityName(curentLocation) { (cityName, error) in
                if error != nil {
                    print("something wrong with location getting  ")
                    return
                }
                self.networkService.getWeatherData({ (weather, eror) in
                    print("Network Finished ")
                    if let error = error {
                        print("\(error)")
                        return
                    }
                    weather?.cityName = cityName
                    DispatchQueue.main.sync {
                        self.postNotification(userInfo: weather)
                    }
                })
            }
        }
    }
    
    func postNotification(userInfo dataModel: TTWeather?) {
        if let dataModel = dataModel {
            let container: [String: Any] = [notificationUserInfoKey: dataModel]
            NotificationCenter.default.post(name: dataFetched, object: nil, userInfo: container)
            print("Notification Posted")
        } else {
            print("Notification did not post")
        }
    }
    
}














