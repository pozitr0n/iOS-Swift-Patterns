//
//  OpenWeatherAPI.swift
//  Bridge
//
//  Created by Raman Kozar on 02/11/2023.
//

import Foundation

class Days: Codable {
    let days: [Day]
}

class Day: Codable {
    let datetime: String
    let icon: String
    let temp: Double
}

class OpenWeatherAPI {
    
    static let apiKey = "REJRJVDU6FW7BD25ZQXERH8F9"
    let condition: [Int:Int] = [1:0, 2:1, 3:2, 4:3, 5:4, 6:5, 7:6]
    
    private func getURL(city cityName: String) -> URL {
    
        let urlBefore: URL? = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(cityName)/next7days?unitGroup=metric&include=days&key=\(OpenWeatherAPI.apiKey)&contentType=json")
        
        guard let url = urlBefore else {
            return URL(string: "")!
        }
        
        return url
        
    }
    
    public func getTemperatureByDay(day index: Int, city cityName: String, completion: @escaping (_ data: [String]) -> Void) {
     
        let urlToTheTemperature = getURL(city: cityName)
        print(urlToTheTemperature)
        
        loadDataFromTheURL(url: urlToTheTemperature, completion: { (result, error) in
            
            var returnArray: [String] = []
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let unwrData = result else {
                return
            }
            
            do {
                
                let dayObject = try JSONDecoder().decode(Days.self, from: unwrData as! Data)
                let objectsJSON = dayObject.days
                
                for itemJSON in objectsJSON {
                    
                    let date = self.dateFromISOString(itemJSON.datetime)
                    
                    guard let date = date else {
                        return
                    }
                   
                    let dayOfTheWeek = self.condition[date.dayNumberOfWeek()!]
                    
                    if dayOfTheWeek == index {
                        
                        returnArray.append("\(itemJSON.temp)°С")
                        returnArray.append(itemJSON.icon)
                        
                        completion(returnArray)
                        return
                        
                    }
                    
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        })
        
    }
    
    private func loadDataFromTheURL(url: URL, completion: @escaping (_ data: Any?, _ error: Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let data = data {
                completion(data, nil)
            } else {
                completion(nil, nil)
            }
            
        })
        
        task.resume()
        
    }
    
    private func dateFromISOString(_ isoString: String) -> Date? {
        
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate]  // ignores time!
        
        return isoDateFormatter.date(from: isoString)  // returns nil, if isoString is malformed.
        
    }
    
}

extension Date {
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
}
