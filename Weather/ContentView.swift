//
//  ContentView.swift
//  Weather
//
//  Created by Ali Yasin Eser on 09.02.23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var date = Date()
    var latitude = 52.520551
    var longitude = 13.461804

    let weatherService = WeatherServiceImpl()

    @State var temp: Double?

    var body: some View {
        ScrollView {
            if let temp {
                Text("\(temp)")
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                temp = await weatherService.fetchTemp()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
