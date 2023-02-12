//
//  ContentView.swift
//  Weather
//
//  Created by Ali Yasin Eser on 09.02.23.
//

import SwiftUI
import CoreLocation

struct ContentView<Presenter: DashboardPresenter>: View {

    @ObservedObject var presenter: Presenter

    init(presenter: Presenter) {
        self.presenter = presenter
    }

    @State var temp: Double?

    var body: some View {
        VStack {
            if let forecast = presenter.forecast {
                List {
                    Text("\(forecast.elevation)")
                }
            } else {
                ProgressView()
            }
        }
        .onAppear(perform: presenter.fetchForecast)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            presenter: DashboardPresenterImpl()
        )
    }
}
