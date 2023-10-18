//
//  MyLocViewModal.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 11/10/23.
//
//this is view Model for Handling, and managing operations between view and model for forcast api data
import Foundation
import UIKit
import CoreLocation

class MyLocationVM {
    
    var eventHandler: ((Event) -> Void)?
    var forecastData: ForecastResponse?
    var lat: Double? = 0.0
    var lon: Double? = 0.0
    
    var queryItems: [URLQueryItem]? = nil
    private let weatherApiService: WeatherAPIServiceDelegate
    init(weatherApiService: WeatherAPIServiceDelegate = WeatherApiService()) { //here init is used for mock data
        self.weatherApiService = weatherApiService
    }
    
    func getForecastData() {
        addQueryParams()
        self.eventHandler?(.loading)
        weatherApiService.getForecastData(modelType: ForecastResponse.self,
                                          type: EndPointItems.forecast, queryItems: queryItems!
        ) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let forecast):
                    self.forecastData = forecast
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    func addQueryParams() {
        queryItems = [
            URLQueryItem(name: "lat", value: "\(self.lat!)"),
            URLQueryItem(name: "lon", value: "\(self.lon!)"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: Constant.appid)
        ]
    }
    
    enum Constant {
        
        enum URL {
            static let weatherImageUrl = "https://openweathermap.org/img/wn/"
            static let apiBaseUrl = "https://api.openweathermap.org/data/2.5/"
        }
        
        static let appid = "3f12be7cfb02c3ddcdc448d07932bc07"
    }

}
    
    
    
    
    


