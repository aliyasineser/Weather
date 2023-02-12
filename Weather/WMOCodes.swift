//
//  WMOCodes.swift
//  Weather
//
//  Created by Ali Yasin Eser on 12.02.23.
//

import Foundation

enum WMOWeatherCode: String {
    case clearSky = "Clear sky"
    case partlyCloudy = "Mainly clear, partly cloudy, and overcast"
    case fog = "Fog and depositing rime fog"
    case drizzle = "Drizzle: Light, moderate, and dense intensity"
    case freezingDrizzle = "Freezing Drizzle: Light and dense intensity"
    case rain = "Rain: Slight, moderate and heavy intensity"
    case freezingRain = "Freezing Rain: Light and heavy intensity"
    case snowFall = "Snow fall: Slight, moderate, and heavy intensity"
    case snowGrains = "Snow Grains"
    case rainShowers = "Rain showers: Slight, moderate, and violent"
    case snowShowers = "Snow showers slight and heavy"
    case thunderStorm = "Thunderstorm: Slight or moderate"
    case thunderStormWithHail = "Thunderstorm with slight and heavy hail"
    case unknown = "Unknown"

    static func fromCodeNo(from: Int) -> WMOWeatherCode {
        if from == 0 { return .clearSky }
        else if [1,2,3].contains(from) { return .partlyCloudy }
        else if [45,48].contains(from)  { return .fog }
        else if [51,53,55].contains(from)  { return .drizzle }
        else if [56,57].contains(from)  { return .freezingDrizzle }
        else if [61,63,65].contains(from)  { return .rain }
        else if [66,67].contains(from)  { return .freezingRain }
        else if [71,73,75].contains(from)  { return .snowFall }
        else if from == 77  { return .snowGrains }
        else if [80,81,82].contains(from)  { return .rainShowers }
        else if [85,86].contains(from)  { return .snowShowers }
        else if from == 95 { return .thunderStorm }
        else if [96,99].contains(from)  { return .thunderStormWithHail }
        else { return .unknown}
    }
}
