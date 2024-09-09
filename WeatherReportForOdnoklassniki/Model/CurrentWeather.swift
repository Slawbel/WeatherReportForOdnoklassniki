import UIKit

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.1f", feelsLikeTemperature)
    }
    
    let pressure: Double
    var pressureString: String {
        return String(format: "%.0f hPa", pressure)
    }
    
    let humidity: Double
    var humidityString: String {
        return String(format: "%.0f%%", humidity)
    }
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.1f km/h", windSpeed)
    }
    
    let windDegree: Double
    var windDegreeString: String {
        return String(format: "%.1f km/h", windDegree)
    }
    
    let cloudiness: Double
    var cloudinessString: String {
        return String(format: "%.0f%%", cloudiness)
    }
    
    let sunrise: Int
    var sunriseTime: String {
        return formatTimestamp(sunrise)
    }
    
    let sunset: Int
    var sunsetTime: String {
        return formatTimestamp(sunset)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
            case 200...232: return "cloud.bolt.rain.fill"
            case 300...321: return "cloud.drizzle.fill"
            case 500...531: return "cloud.rain.fill"
            case 600...622: return "cloud.snow.fill"
            case 701...781: return "smoke.fill"
            case 800: return "sun.min.fill"
            case 801...804: return "cloud.fill"
            default: return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        guard let weatherCondition = currentWeatherData.weather.first else { return nil }
        
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        pressure = currentWeatherData.main.pressure
        humidity = currentWeatherData.main.humidity
        windSpeed = currentWeatherData.wind.speed
        windDegree = currentWeatherData.wind.deg
        cloudiness = currentWeatherData.clouds.all
        sunrise = currentWeatherData.sys.sunrise
        sunset = currentWeatherData.sys.sunset
        conditionCode = weatherCondition.id
    }
    
    private func formatTimestamp(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
