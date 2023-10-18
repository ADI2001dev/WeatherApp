//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 17/10/23.
//

import Foundation

protocol WeatherAPIServiceDelegate {
    func getWeatherData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        queryItems: [URLQueryItem],
        completion: @escaping Handler<T>
    )
    
    func getForecastData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        queryItems: [URLQueryItem],
        completion: @escaping Handler<T>
    )
}

class WeatherApiService: WeatherAPIServiceDelegate {
    func getWeatherData<T: Codable>(modelType: T.Type, type: EndPointAPIType, queryItems: [URLQueryItem], completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, queryItems: queryItems, completion: completion)
    }
    
    func getForecastData<T: Codable>(modelType: T.Type, type: EndPointAPIType, queryItems: [URLQueryItem], completion: @escaping Handler<T>) where T : Decodable, T : Encodable {
        APIManager.shared.request(modelType: modelType, type: type, queryItems: queryItems, completion: completion)
    }
}
