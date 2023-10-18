//
//  DatabaseManager.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 16/10/23.
//

import UIKit
import CoreData

struct WeatherData {
    let city : String
    let desc : String
    let img : String
    let temp : String
}

class DatabaseManager {
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func addData(id: String, temp: String, city: String, image: String, weatherDesc: String) -> WeatherSearch? {
        let weather = WeatherSearch(context: context!)
        weather.temp = temp
        weather.city = city
        weather.img = image
        weather.desc = weatherDesc
        weather.id = id
        do {
            try context!.save()
            return weather
        } catch {
            print("fatalError in adding weather city")
        }
        return nil
    }
    
    func updateWeather(id: String, temp: String, city: String, image: String, weatherDesc: String) -> WeatherSearch?{
        let fetchRequest = WeatherSearch.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do{
            let results = try context!.fetch(fetchRequest)
            guard let SendUpdateData = results.first
            else {return nil}
            SendUpdateData.id = id
            SendUpdateData.temp = temp
            SendUpdateData.city = city
            SendUpdateData.img = image
            SendUpdateData.desc = weatherDesc
            try context!.save()
            return SendUpdateData
        }
        catch{
            print("Error While fetching Weather")
        }
        return nil
    }
    
    func getDatabyId(id:String) ->Bool {
        let fetchRequest = WeatherSearch.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        if ((try? context!.fetch(fetchRequest).first) != nil) {
            return true
        }
        return false
    }
    
    func fetchWeather() -> [WeatherSearch]? {
        do{
            return try context!.fetch(WeatherSearch.fetchRequest())
        }
        catch{
            print("Data not Fetched")
        }
        return nil
    }
}
