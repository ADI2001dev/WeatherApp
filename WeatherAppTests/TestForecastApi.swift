//
//  TestForecastApi.swift
//  WeatherAppTests
//
//  Created by Adityakumar Ramnuj on 17/10/23.
//

import Foundation
import XCTest
import WeatherApp
@testable import WeatherApp

final class TestForecastApi : XCTestCase{
    
    var mockFromApiClass : MockWeatherApiService!
    var viewModal : MyLocationVM!
    
    override func setUp(){
        mockFromApiClass = MockWeatherApiService()
        viewModal = MyLocationVM(weatherApiService: mockFromApiClass)
    }
    override func tearDown(){
        mockFromApiClass = nil
        viewModal = nil
    }
    
    func test_ApiFailure(){ // Forecast Api
        mockFromApiClass.resultForecast = .failure(.invalidData)
        viewModal.getForecastData()
        XCTAssertNil(viewModal.forecastData, "Forecast Data is not nil")
    }
    
    func test_WeatherAPISuccess() {
        guard let forecast = mockFromApiClass.forecast() else { return }
        mockFromApiClass.resultForecast = .success(forecast)
        viewModal.getForecastData()
        XCTAssertNotNil(viewModal.forecastData)
    }
}
