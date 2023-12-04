//
//  ViewController.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 23.11.2023.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var WeatherStatusImage: UIImageView!
    
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
    @IBOutlet weak var hourlyView: hourlyView!
    
    
    var weatherManager = WeatherManager()
    
    
    
    
        
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topWeatherView: UIView!
    
    @IBOutlet weak var bottomBarCompact: UIButton!
    @IBOutlet weak var BottomBar: UIView!
    
 
//    @IBAction func BottomBarButtonDecompact(_ sender: UIButton) {
//        heightConstraint.constant = 565
//        BottomBar.isHidden=false
//        bottomBarCompact.isEnabled = true
//    }
//    
//    @IBAction func BottomBarButton(_ sender: UIButton) {
//        heightConstraint.constant = 353
//        BottomBar.isHidden=true
//        bottomBarCompact.isEnabled = false
//    }

    
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
                                weatherManager.delegate?.didUpdateWeather(weatherManager, weather: weather)
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
            }
        }
        
        
    }
    
    @objc func didSwipe(_ gesture: UIGestureRecognizer) {
        print(gesture)
        guard let gesture = gesture as? UISwipeGestureRecognizer else {
            return
        }
        
        switch gesture.direction {
        case .up:
            BottomBar.isHidden = false
            heightConstraint.constant = 353
            dailyStackView.axis = .horizontal
        case .down:
            BottomBar.isHidden = true
            heightConstraint.constant = 565
            dailyStackView.axis = .vertical
        default:
            break
        }
    }
    

}

