//
//  ApiManager.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 09/10/23.
//
import Foundation

    //API MANAGER reference With jaydip
    //API manager1 is for testing purpose

final class APIManager1 {
    static let shared = APIManager1()
    private let appid = "91f2693ba8ee964e4f74f6f08eb22f5d"
    static var lat: Double? = 0.0
    static var lon: Double? = 0.0
    static var searchCity: String? = nil
    private init() {}
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    ) async {
        guard let strURL = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        
        var queryItems: [URLQueryItem]? = nil
        if type.apiType == "weather" || type.apiType == "forecast" {
            queryItems = [URLQueryItem(name: "lat", value: "\(APIManager1.lat!)"), URLQueryItem(name: "lon", value: "\(APIManager1.lon!)"),URLQueryItem(name: "units", value: "metric"),URLQueryItem(name: "appid", value: appid)]
        } else if type.apiType == "location" {
            queryItems = [URLQueryItem(name: "q", value: "\(APIManager1.searchCity!)"),URLQueryItem(name: "units", value: "metric"),URLQueryItem(name: "appid", value: appid)]
        }
        
        var urlComps = URLComponents(string: strURL)
        urlComps?.queryItems = queryItems
        var request = URLRequest(url: (urlComps?.url)!)
        request.httpMethod = type.methods.rawValue
        request.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let response = try JSONDecoder().decode(modelType, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(.network(error)))
            }
        }.resume()
    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
}

