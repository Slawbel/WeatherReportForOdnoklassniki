import UIKit

class ApiViewModel: ObservableObject {
    
    var urlString: String
    var session: URLSession
    var onCompletion: ((CurrentWeather) -> Void)?
    
    init() {
        self.urlString = ""
        self.session = URLSession(configuration: .default)
    }
    
    func fetchWeatherAPIRequest(forCity city: String?, completionHandler: @escaping (CurrentWeather) -> Void) {
        guard let city = city else { return }
        self.urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
 
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            } else if let error = error {
                print("Request error: \(error)")
            }
        }
        task.resume()
    }
    
    func parseJSON (withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
