//
//  DashboardPresenter.swift
//  Weather
//
//  Created by Ali Yasin Eser on 12.02.23.
//

import Foundation
import SwiftUI
import CoreLocation

protocol DashboardPresenter: ObservableObject {
    var forecast: [HourlyForecast] { get }

    var latitude: CLLocationDegrees { get }
    var longitude: CLLocationDegrees { get }
    var locationDataManager: LocationDataManager { get }

    func fetchForecast()
}

final class DashboardPresenterImpl: DashboardPresenter {
    @Published var forecast: [HourlyForecast] = []

    @ObservedObject var locationDataManager: LocationDataManager

    init(locationDataManager: LocationDataManager) {
        self.locationDataManager = locationDataManager

        self.latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 31
        self.longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 31
    }

    let weatherService = WeatherServiceImpl()
    @Published var latitude: CLLocationDegrees = 1.0
    @Published var longitude: CLLocationDegrees = 1.0

    @MainActor
    func fetchForecast() {
        Task {
            forecast = try await weatherService.fetchTemp(lat: latitude, lon: longitude)
        }
    }

}
