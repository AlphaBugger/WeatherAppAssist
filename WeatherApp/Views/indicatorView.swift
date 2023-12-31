//
//  indicatorView.swift
//  WeatherApp
//
//  Created by Eduard Zepciuc on 24.11.2023.
//

import UIKit
@IBDesignable
final class indicatorView: UIView {
    
    
    @IBOutlet weak var unit: UILabel!
    
    @IBOutlet weak var unitName: UILabel!
    
    @IBOutlet weak var unitImage: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
        }

    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "indicatorView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
}

