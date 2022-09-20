//
//  ForecastWeatherData.swift
//  Weather
//
//  Created by admin on 6.09.22.
//

import Foundation

// MARK: - Server response data model
struct ForecastWeatherData: Codable {
    let city: City
    let list: [WeatherForecast]
}

struct City: Codable {
    let name: String
}

struct WeatherForecast: Codable {
    let main: MainClass
    let weather: [WeatherCode]
    let wind: WindSpeed
    let dtTxt: String
    //let humidity: Humidity
   
    enum CodingKeys: String, CodingKey {
        case main, weather, wind
        case dtTxt = "dt_txt"
    }
}

struct MainClass: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity 
    }
}

struct WeatherCode: Codable {
    let id: Int
}

struct WindSpeed: Codable {
    let speed: Double
}

struct Humidity: Codable {
    let percent: Double
}
