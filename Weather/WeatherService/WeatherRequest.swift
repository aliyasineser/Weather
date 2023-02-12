//
//  WeatherService.swift
//  Weather
//
//  Created by Ali Yasin Eser on 11.02.23.
//

import Foundation

enum WeatherRequest: NetworkRequest {
    case general(lat: Double, lon: Double)

    var urlParams: [String : String?] {
        switch self {
        case .general(let lat, let lon):
            return ["latitude": "\(lat)",
                    "longitude": "\(lon)",
                    "hourly": "temperature_2m,relativehumidity_2m,rain,windspeed_10m,winddirection_10m,weathercode"
            ]
        }
    }

    var requestType: RequestType {
        switch self {
        case .general(_, _):
            return .GET
        }
    }
}
