//
//  DataManager.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 28.11.2023.
//

import Foundation
import UIKit


extension ViewController: WeatherManagerDelegate{
    
    
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherViewModel) {
        DispatchQueue.main.async {
            self.WindIndicator.unitImage.image = UIImage(systemName:"location.fill")
            self.WindIndicator.unitName.text = "Wind"
            self.WindIndicator.unit.text = String(format:"%.1f km/h",weather.forecastList[0].wind.speed)
            
            self.RainIndicator.unitImage.image = UIImage(systemName:"cloud.rain")
            self.RainIndicator.unitName.text = "Chance of rain"
            self.RainIndicator.unit.text = String(format:"%.1f%%",weather.forecastList[0].pop)
            
            self.PressureIndicator.unitImage.image = UIImage(systemName: "thermometer.medium")
            self.PressureIndicator.unitName.text = "Pressure"
            self.PressureIndicator.unit.text = String(format:"%.0f mbar",weather.forecastList[0].main.pressure)
            
            self.humidityIndicator.unitImage.image = UIImage(systemName: "drop.degreesign")
            self.humidityIndicator.unitName.text = "Humidity"
            self.humidityIndicator.unit.text = "\(String(weather.forecastList[0].main.humidity))%"
            
            
            switch getDateForLabel(dateString: weather.forecastList[0].dt_txt){
            case .success(let result):
                self.currentDate.dayNameLabel.text = result.dayName
                self.currentDate.currentMonthAndDay.text = String("\(result.month) \(result.day)")
                self.hourlyView.currentDate.dayNameLabel.text = result.dayName
                self.hourlyView.currentDate.currentMonthAndDay.text = String("\(result.month) \(result.day)")
            case .failure(_):
                print("error")
            }
            self.TopTemperature.text = String(format:"%.0f °",weather.forecastList[0].main.temp)
            
            for forecastItem in weather.forecastList{
                    
                }
            }

        }
        
    func didFailWithError(error: Error) {
        print(error)
    }

}
        
        
