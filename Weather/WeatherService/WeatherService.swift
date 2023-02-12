//
//  WeatherService.swift
//  Weather
//
//  Created by Ali Yasin Eser on 11.02.23.
//

import Foundation

protocol WeatherService {

}

final class WeatherServiceImpl: WeatherService {
    private let requestManager: RequestManager

    init(requestManager: RequestManager = DefaultRequestManager()) {
        self.requestManager = requestManager
    }

    func fetchTemp() async throws -> TemperatureForecast {
        let requestData = WeatherRequest.general(lat: 48.14, lon: 11.58)
        let temp: TemperatureForecast = try await requestManager.initRequest(with: requestData)
        return temp
    }

}
