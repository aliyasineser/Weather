//
//  WeatherApp.swift
//  Weather
//
//  Created by Ali Yasin Eser on 09.02.23.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: DashboardPresenterImpl())
        }
    }
}
