//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Adityakumar Ramnuj on 06/10/23.
//

import XCTest
@testable import WeatherApp
import CoreLocation
import CoreData

final class WeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    
    var weatherInts : SearchWeatherVM!
    override func setUp() {
           super.setUp()
        weatherInts = SearchWeatherVM()
       }

       override func tearDown() {
           weatherInts = nil
           super.tearDown()
       }
    let sc = SearchBarVC()
    func testTextFieldShouldReturn() { // text field Return data Checking
     
        let textField = UITextField()
        textField.text = "New York"
        let result = sc.textFieldShouldReturn(textField)
        
        XCTAssertTrue(result, "Expected the function to return true")
        XCTAssertEqual(textField.text, "", "Text field not cleared")
    }
    
    //Weather Box adding
    let CoreDataInst = DatabaseManager()
    func testAddWeatherData(){
        if let testData = CoreDataInst.addData(id: "1", temp: "25°C", city: "New York", image: "sunny", weatherDesc: "Sunny day") {
                
                 XCTAssertEqual(testData.id, "1")
                 XCTAssertEqual(testData.temp, "25°C")
                 XCTAssertEqual(testData.city, "New York")
                XCTAssertEqual(testData.img, "sunny")
                XCTAssertEqual(testData.desc, "Sunny day")
             } else {
                 XCTFail("Failed to add WeatherSearch data")
             }
    }
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func testUpdateWeather() {
            
            let id = "1"
            let temp = "25°C"
            let city = "New York"
            let image = "sunny"
            let weatherDesc = "Sunny day"

        
        let updatedData = CoreDataInst.updateWeather(id: id, temp: temp, city: city, image: image, weatherDesc: weatherDesc)
            XCTAssertNotNil(updatedData)
        
            let fetchRequest: NSFetchRequest<WeatherSearch> = WeatherSearch.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)

            do {
                let results = try context!.fetch(fetchRequest)
               
                let fetchedData = results.first
                XCTAssertEqual(fetchedData?.id, id)
                XCTAssertEqual(fetchedData?.temp, temp)
                XCTAssertEqual(fetchedData?.city, city)
                XCTAssertEqual(fetchedData?.img, image)
                XCTAssertEqual(fetchedData?.desc, weatherDesc)
            } catch {
                XCTFail("Error while fetching WeatherSearch data")
            }
        }
    
    
//    func testFetchWeather() {
//        let data = DatabaseManager()
//            let testData = createTestDataInCoreData()
//        let fetchedData = data.fetchWeather()
//            XCTAssertNotNil(fetchedData)
//        
//            let fetchedEntry = fetchedData?.first
//            XCTAssertEqual(fetchedEntry?.id, testData.id)
//            XCTAssertEqual(fetchedEntry?.temp, testData.temp)
//            XCTAssertEqual(fetchedEntry?.city, testData.city)
//            XCTAssertEqual(fetchedEntry?.img, testData.img)
//            XCTAssertEqual(fetchedEntry?.desc, testData.desc)
//        }
    
//    func createTestDataInCoreData() -> WeatherSearch {
//        let testData = WeatherSearch(context: context!)
//            testData.id = "1"
//            testData.temp = "25°C"
//            testData.city = "New York"
//            testData.img = "sunny"
//            testData.desc = "Sunny day"
//
//            do {
//                try context!.save()
//            } catch {
//                XCTFail("Error while saving test data")
//            }
//
//            return testData
//        }


    }
    

    




//struct MockData {
//       static let mockForecast: ForecastResponse = {
//           // Create mock data for your structures
//           let main = Main(temp: 20.0, feels_like: 19.0, humidity: 60)
//           let weather = [Weather(id: 800, main: "Clear", description: "Clear sky")]
//           let wind = Wind(speed: 5.0, deg: 120)
//           let list = List(main: main, weather: weather, wind: wind, dt_txt: "2023-10-15 12:00:00")
//           let city = City(id: 1, name: "Mock City", coord: Coord(lat: 0.0, lon: 0.0), country: "MO", timezone: 0, sunrise: 0, sunset: 0)
//
//           return ForecastResponse(list: [list], city: city)
//       }()
//   }

//{
//    "list": [
//        {
//            "main": {
//                "temp": 25.0,
//                "pressure": 1010,
//                "humidity": 70
//            },
//            "weather": [
//                {
//                    "main": "Clear",
//                    "description": "Clear sky"
//                }
//            ],
//            "wind": {
//                "speed": 5.0
//            },
//            "dt_txt": "2023-10-15 12:00:00"
//        }
//    ],
//    "city": {
//        "id": 1, // Add an "id" key
//        "name": "Example City",
//        "coord": {
//            "lon": 0.0,
//            "lat": 0.0
//        },
//        "country": "US",
//        "timezone": -18000,
//        "sunrise": 1634270400,
//        "sunset": 1634313600
//    }
//}
//"""


//class mock api manager

//func testGetForecastData() {}
