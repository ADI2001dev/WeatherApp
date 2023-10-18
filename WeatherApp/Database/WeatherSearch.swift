//
//  WeatherSearch+CoreDataClass.swift
//  WeatherApp
//
//  Created by Adityakumar Ramnuj on 16/10/23.
//
//

import Foundation
import CoreData

@objc(WeatherSearch)
public class WeatherSearch: NSManagedObject {

}
extension WeatherSearch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherSearch> {
        return NSFetchRequest<WeatherSearch>(entityName: "WeatherSearch")
    }

    @NSManaged public var city: String?
    @NSManaged public var temp: String?
    @NSManaged public var desc: String?
    @NSManaged public var img: String?
    @NSManaged public var id: String?

}

extension WeatherSearch : Identifiable {

}
