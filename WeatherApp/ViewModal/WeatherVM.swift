//
//  SearchWeatherVM.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 13/10/23.
//
//this is view Model for Handling, and managing operations between view and model for current weather api data
import Foundation
import CoreLocation
import UIKit
import TinyConstraints
import CoreData

class SearchWeatherVM {
    var eventHandler: ((Event) -> Void)?
    var weatherData: WeatherResponse?
    var pickLocationData: WeatherResponse?
    var search: String? = nil
    var lat: Double? = 0.0
    var lon: Double? = 0.0
    
    private let weatherApiService: WeatherAPIServiceDelegate
    
    init(weatherApiService: WeatherAPIServiceDelegate = WeatherApiService()) {
        self.weatherApiService = weatherApiService
    }
    var queryItems: [URLQueryItem]? = nil
    func getWeatherData() {
        addQueryParams()
        self.eventHandler?(.loading)
        weatherApiService.getWeatherData(modelType: WeatherResponse.self,
                                         type: (self.search != nil) ? EndPointItems.location : EndPointItems.weather, queryItems: queryItems!) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let weather):
                    (self.search != nil) ? (self.pickLocationData = weather) : (self.weatherData = weather)
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func formatDate(dt: Int) -> String {
        let timestamp = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func addQueryParams() {
        if self.search != nil {
            queryItems = [
                URLQueryItem(name: "q", value: search),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Constant.appid)
            ]
        } else {
            queryItems = [
                URLQueryItem(name: "lat", value: "\(self.lat!)"),
                URLQueryItem(name: "lon", value: "\(self.lon!)"),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Constant.appid)
            ]
        }
    }
    
}
enum Event {
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
enum Constant {
    
    enum URL {
        static let weatherImageUrl = "https://openweathermap.org/img/wn/"
        static let apiBaseUrl = "https://api.openweathermap.org/data/2.5/"
    }
    
    static let appid = "3f12be7cfb02c3ddcdc448d07932bc07"
}
