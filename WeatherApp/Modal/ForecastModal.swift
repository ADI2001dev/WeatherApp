//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 09/10/23.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [List]
    let city: City
}

struct List: Codable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let dt_txt: String
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}
