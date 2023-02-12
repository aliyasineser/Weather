//
//  DashboardPresenter.swift
//  Weather
//
//  Created by Ali Yasin Eser on 12.02.23.
//

import Foundation

protocol DashboardPresenter: ObservableObject {
    var forecast: TemperatureForecast? { get }

    func fetchForecast()
}

final class DashboardPresenterImpl: DashboardPresenter {
    @Published var forecast: TemperatureForecast?

    let weatherService = WeatherServiceImpl()
    var latitude = 52.520551
    var longitude = 13.461804

    @MainActor
    func fetchForecast() {
        Task {
            forecast = try await weatherService.fetchTemp()
        }
    }

}
