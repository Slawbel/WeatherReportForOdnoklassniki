import UIKit

struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    
    struct Main: Decodable {
        let temp: Double
        let feelsLike: Double
        let pressure: Double
        let humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
        }
    }
    
    struct Weather: Decodable {
        let id: Int
        let description: String
        let icon: String
    }
    
    struct Wind: Decodable {
        let speed: Double
        let deg: Double
    }
    
    struct Clouds: Decodable {
        let all: Double
    }
    
    struct Sys: Decodable {
        let sunrise: Int
        let sunset: Int
    }
}
