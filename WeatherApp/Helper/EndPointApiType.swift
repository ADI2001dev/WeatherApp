//
//  EndPointApiType.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 09/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

protocol EndPointAPIType {
    var path: String { get }
    var baseURL: String { get }
    var url: String? { get }
    var methods: HttpMethod { get }
    var headers: [String: String]? { get }
    var apiType: String? {get}
}

enum EndPointItems {
    case weather
    case forecast
    case location
}

extension EndPointItems: EndPointAPIType {

    var headers: [String : String]? {
        return APIManager.commonHeaders
    }
    var path: String {
        switch self {
        case .weather:
            return "weather"
        case .forecast:
            return "forecast"
        case .location:
            return "weather"
        }
    }
    var baseURL: String {
        return "https://api.openweathermap.org/data/2.5/"
    }
    var url: String? {
        return "\(baseURL)\(path)"
    }
    var methods: HttpMethod {
        return .get
    }
    var apiType: String? {
        switch self {
        case .weather:
            return "weather"
        case .forecast:
            return "forecast"
        case .location:
            return "location"
        }
    }
}
