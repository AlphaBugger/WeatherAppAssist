//
//  indicatorView.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 24.11.2023.
//

import UIKit

class indicatorView: UIView {
    
     @IBOutlet var indicatorView: indicatorView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }

        private func commonInit() {
            Bundle.main.loadNibNamed("indicatorView", owner: self, options: nil)
            addSubview(indicatorView)
            indicatorView.frame = bounds
            indicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
}

