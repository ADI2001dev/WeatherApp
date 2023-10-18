//
//  MockApiService.swift
//  WeatherAppTests
//
//  Created by Adityakumar Ramnuj on 17/10/23.
//

//This class is made for testing purpose. it conforms the delegate in Weather service. it act just like api service
import Foundation
@testable import WeatherApp


class MockWeatherApiService: WeatherAPIServiceDelegate {
    
    var result: Result<WeatherResponse, DataError>!
    var resultForecast: Result<ForecastResponse, DataError>!
    
    func getWeatherData<T: Codable>(modelType: T.Type, type: EndPointAPIType, queryItems: [URLQueryItem], completion: @escaping Handler<T>) {
        completion(result as! Result<T, DataError>)
    }
    
    func getForecastData<T>(modelType: T.Type, type: WeatherApp.EndPointAPIType, queryItems: [URLQueryItem], completion: @escaping WeatherApp.Handler<T>) where T : Decodable, T : Encodable {
        completion(resultForecast as! Result<T, DataError>)
    }
    
    //This func will get the weather data in form of weather Response
    func weather() -> WeatherResponse? {
        do {
            guard let weatherData = weatherData else {
                return nil
            }
            return try JSONDecoder().decode(WeatherResponse.self, from: weatherData)
        } catch {
            return nil
        }
    }
    
    //This func will get the Forecast data in form of Forecast Response
    func forecast() -> ForecastResponse? {
        do {
            guard let forecastData = forecastData else {
                return nil
            }
            return try JSONDecoder().decode(ForecastResponse.self, from: forecastData)
        } catch {
            return nil
        }
    }
}
