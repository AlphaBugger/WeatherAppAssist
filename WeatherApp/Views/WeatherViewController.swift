//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 23.11.2023.
//

import UIKit
class WeatherViewController: UIViewController {
    
    
    
    @IBOutlet weak var WeatherStatusImage: UIImageView!
    
    @IBOutlet weak var dailyForecast: WeeklyForecastView!
    @IBOutlet weak var hourlyViewBottom: NSLayoutConstraint!
    @IBOutlet weak var dailyStackView: UIStackView!
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var TopTemperature: UILabel!
    @IBOutlet weak var currentDate: DateView!
    @IBOutlet weak var WeatherDescription: UILabel!
    @IBOutlet weak var WindIndicator: indicatorView!
    @IBOutlet weak var PressureIndicator: indicatorView!
    @IBOutlet weak var RainIndicator: indicatorView!
    @IBOutlet weak var humidityIndicator: indicatorView!
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var hourlyView: WeatherView!

    @IBOutlet weak var topWeatherView: UIView!
    @IBOutlet weak var bottomBarCompact: UIButton!
    @IBOutlet weak var BottomBar: UIView!
    
//    var weatherViewModel: WeatherViewModel = WeatherViewModel(weatherData: <#T##WeatherData#>)
    
    
    
    
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_ :)))
        swipeGestureUp.direction = .up
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_ :)))
        swipeGestureDown.direction = .down
        
        view.addGestureRecognizer(swipeGestureUp)
        view.addGestureRecognizer(swipeGestureDown)
        
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
                                self.didUpdateWeather(weatherManager, weather: weather)
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
            }
        }
        
        
    }
    
    @objc func didSwipe(_ gesture: UIGestureRecognizer) {
        guard let gesture = gesture as? UISwipeGestureRecognizer else {
            return
        }
        
        switch gesture.direction {
            case .up:
                self.hourlyViewBottom.constant = 215
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    self.dailyStackView.axis = .horizontal
                } completion: { finished in
                    if finished {
                        self.BottomBar.isHidden = true
                    }
                }
                
            case .down:
                self.hourlyViewBottom.constant = 0
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    self.dailyStackView.axis = .vertical
                } completion: { finished in
                    if finished {
                        self.BottomBar.isHidden = false
                    }
                }
                
            default:
                break
        }
        
    }
    

}

