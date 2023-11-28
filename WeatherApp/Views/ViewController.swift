//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 23.11.2023.
//

import UIKit
class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var WeatherStatusImage: UIImageView!
    
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var TopTemperature: UILabel!
    @IBOutlet weak var WeatherDescription: UILabel!
    @IBOutlet weak var WindIndicator: indicatorView!
    
    @IBOutlet weak var PressureIndicator: indicatorView!
    
    @IBOutlet weak var RainIndicator: indicatorView!
    @IBOutlet weak var humidityIndicator: indicatorView!
    @IBOutlet weak var arrowView: UIImageView!
    
    
    var weatherManager = WeatherManager()
    
    
    
    
        
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topWeatherView: UIView!
    
    @IBOutlet weak var bottomBarCompact: UIButton!
    @IBOutlet weak var bottomButtonDecompact: UIButton!
    @IBOutlet weak var BottomBar: UIView!
    @IBOutlet weak var bottomBarDecompact: UIView!
    
 
    @IBAction func BottomBarButtonDecompact(_ sender: UIButton) {
        heightConstraint.constant = 565
        BottomBar.isHidden=false
        bottomBarDecompact.isHidden = true
        bottomBarCompact.isEnabled = true
        bottomButtonDecompact.isEnabled = false
        
    }
    
    @IBAction func BottomBarButton(_ sender: UIButton) {
        heightConstraint.constant = 353
        BottomBar.isHidden=true
        bottomBarDecompact.isHidden = false
        bottomBarCompact.isEnabled = false
        bottomButtonDecompact.isEnabled = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        topWeatherView.layer.cornerRadius = 30
        
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
    

}

