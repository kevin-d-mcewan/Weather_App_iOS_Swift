//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by user229431 on 11/17/22.
//

import Foundation
import CoreLocation

class WeatherManager {
    // HTTP request to get the current weather from coordinates from LocationManager Script
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
    // Original API Website https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=d70621700d5020f6366588f0f3f7bdce&units=metric")
        else {fatalError("Missing URL")}
        
        // urlRequest var is the URL we created on line 15
        let urlRequest = URLRequest(url: url)
        
        // save the information we get in a 'data' & 'response' variables
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // 'guard' the response status code with 200 and if thats not what we get throw a fatal error
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
}

extension ResponseBody.MainResponse {
    var feelsLike: Double {return feels_like }
    var tempMin: Double {return temp_min }
    var tempMax: Double {return temp_max}
    
}
