//
//  weatherTopView.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 23.11.2023.
//

import UIKit

class weatherTopView: UIView {

    @IBOutlet var weatherView: UIView!
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }

        private func commonInit() {
            Bundle.main.loadNibNamed("weatherTopView", owner: self, options: nil)
            addSubview(weatherView)
            weatherView.frame = bounds
            weatherView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }

}
