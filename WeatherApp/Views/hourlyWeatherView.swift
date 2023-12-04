import UIKit
@IBDesignable
final class hourlyWeatherView: UIView {
    
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var currentAndMaxTemp: UILabel!
    @IBOutlet weak var weatherStatus: UIImageView!
    @IBOutlet weak var channceOfRain: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
        }

    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "hourlyWeatherView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
}
