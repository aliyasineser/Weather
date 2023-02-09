//
//  ContentView.swift
//  Weather
//
//  Created by Ali Yasin Eser on 09.02.23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var meteo: Meteomatics

    var date = Date()
//    Full list of available parameters at https://www.meteomatics.com/en/api/available-parameters/alphabetic-list/
    var parameters = ["t_2m:C", "wind_speed_850hPa:ms"]
    var latitude = 52.520551
    var longitude = 13.461804
    var user = ""
    var password = ""

    init() {
        meteo = Meteomatics(forDate: date, parameters: self.parameters, latitude: self.latitude, longitude: self.longitude, user: self.user, password: self.password)
    }

    @State var weather: MeteomaticsData = MeteomaticsData()
    var body: some View {
        Text("\(weather.data[0].coordinates[0].dates[0].value)")
            .task {
                do {
                    weather = try await meteo.fetchWeather()
                } catch {
                    print(error)
                }
            }

            .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
