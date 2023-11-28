//
//  DataManager.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 28.11.2023.
//

import Foundation


extension ViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherViewModel) {
        TopTemperature.text = String(weather.forecastList[0].main.temp)
        print(String(weather.forecastList[0].main.temp))
        
        
}
        
        func didFailWithError(error: Error) {
            print(error)
        }
}

