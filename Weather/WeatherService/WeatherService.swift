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

    func fetchTemp() async throws -> [HourlyForecast] {
        let requestData = WeatherRequest.general(lat: 48.14, lon: 11.58)
        let temp: TemperatureForecast = try await requestManager.initRequest(with: requestData)
        var hourlyForecasts: [HourlyForecast] = []
        for index in 0..<temp.hourly.time.count {
            hourlyForecasts.append(
                HourlyForecast(
                    time: temp.hourly.time[index],
                    temperature2M: temp.hourly.temperature2M[index],
                    relativehumidity2M: temp.hourly.relativehumidity2M[index],
                    rain: temp.hourly.rain[index], weathercode: temp.hourly.weathercode[index],
                    windspeed10M: temp.hourly.windspeed10M[index],
                    winddirection10M: temp.hourly.winddirection10M[index],
                    timeUnit: temp.hourlyUnits.time,
                    temperature2MUnit: temp.hourlyUnits.temperature2M,
                    relativehumidity2MUnit: temp.hourlyUnits.relativehumidity2M,
                    rainUnit: temp.hourlyUnits.rain,
                    weathercodeUnit: temp.hourlyUnits.weathercode,
                    windspeed10MUnit: temp.hourlyUnits.windspeed10M,
                    winddirection10MUnit: temp.hourlyUnits.winddirection10M
                )
            )
        }
        return hourlyForecasts
    }

}
