//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 23.11.2023.
//

import UIKit

class ViewController: UIViewController, WeatherManagerDelegate {
    
    
    
    
    
    var weatherManager = WeatherManager()
    
    
    
    @IBOutlet weak var topWeatherIcon: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        if NetworkManager.shared.isInternetAvailable {
            print("Internet is available.")
            print("loaded")
            weatherManager.delegate = self
            // Do any additional setup after loading the view.
            weatherManager.fetchWeather(cityName: "Suceava", unit: "metric")
            print("done")
        } else {
            print("No internet connection.")
            if let storedJsonString = UserDefaults.standard.string(forKey: "weatherJSON"){
                if let jsonData = storedJsonString.data(using: .utf8) {
                        do {
                            // Decode the JSON data into your model or use it as needed
                            if let weather = weatherManager.parseJSON(jsonData){
                                weatherManager.delegate?.didUpdateWeather(weatherManager, weather: weather)
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
            }
        }
        
        
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherViewModel) {
        for item in weather.hourlyForecast{
            print(item.main.temp)
            
        }
        weather.getDailyForecast()
        
    }
    func didFailWithError(error: Error) {
        print(error)
    }

}

