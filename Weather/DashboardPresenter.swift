//
//  DashboardPresenter.swift
//  Weather
//
//  Created by Ali Yasin Eser on 12.02.23.
//

import Foundation

protocol DashboardPresenter: ObservableObject {
    var forecast: [HourlyForecast] { get }

    func fetchForecast()
}

final class DashboardPresenterImpl: DashboardPresenter {
    @Published var forecast: [HourlyForecast] = []

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
