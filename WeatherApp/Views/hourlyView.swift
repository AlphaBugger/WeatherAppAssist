//
//  hourlyView.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 28.11.2023.
//

import UIKit
@IBDesignable
final class hourlyView: UIView {
    
    @IBOutlet weak var currentDate: DateView!
    
    @IBOutlet weak var hourZero: hourlyWeatherView!
    
    @IBOutlet weak var hourOne: hourlyWeatherView!
    
    
    @IBOutlet weak var hourTwo: hourlyWeatherView!
    
    @IBOutlet weak var hourThree: hourlyWeatherView!
    
    @IBOutlet weak var hourFour: hourlyWeatherView!
    
    @IBOutlet weak var hourFive: hourlyWeatherView!
    
    @IBOutlet weak var hourSix: hourlyWeatherView!
    
    @IBOutlet weak var hourSeven
    : hourlyWeatherView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
        }

    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "hourlyView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
}
