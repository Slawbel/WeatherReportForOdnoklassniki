import UIKit

class ApiViewModel: ObservableObject {
    
    var session: URLSession
    
    init() {
        self.session = URLSession(configuration: .default)
    }
    
    func fetchWeatherAPIRequest(forCity city: String, completionHandler: @escaping (CurrentWeather) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    DispatchQueue.main.async {
                        completionHandler(currentWeather)
                    }
                }
            } else if let error = error {
                print("Request error: \(error)")
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            return CurrentWeather(currentWeatherData: currentWeatherData)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
