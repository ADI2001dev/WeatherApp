//
//  CurrentWeatherModal.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 13/10/23.
//

struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let dt: Int
    let sys: System
    let timezone: Int?
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double?
    let pressure: Double
    let humidity: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}

struct System: Codable {
    let type: Int?
    let id: Int?
    let country: String
}
    