//
//  WeatherService.swift
//  Weather
//
//  Created by Ali Yasin Eser on 11.02.23.
//

import Foundation

enum WeatherRequest: NetworkRequest {
    case temperature(lat: Double, lon: Double)

    var urlParams: [String : String?] {
        switch self {
        case .temperature(let lat, let lon):
            return ["latitude": "\(lat)", "longitude": "\(lon)","hourly": "temperature_2m"]

        }
    }

    var requestType: RequestType {
        switch self {
        case .temperature(_, _):
            return .GET
        }
    }

}
