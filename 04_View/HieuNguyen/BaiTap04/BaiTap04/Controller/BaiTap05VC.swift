import UIKit

class BaiTap05VC: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var sliderLabel: UILabel?
    var valueSlider:Float = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        let iconSlider = UIImage(named: "Lol_circle")
        slider.setThumbImage(iconSlider, for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let handleView = slider.subviews.last as? UIImageView {
            let label = UILabel(frame: handleView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            handleView.addSubview(label)
            label.text = "50"
            label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
            self.sliderLabel = label
        }
    }
    @IBAction func sliderAction(_ sender: Any) {
        self.sliderLabel!.text = "\(Int(slider.value))"
    }
    
    
}

