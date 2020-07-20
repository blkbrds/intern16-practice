//  BaiTap04
import UIKit

final class Bai04ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var viewColor: UIView!
    @IBOutlet private weak var textColorLabel: UILabel!
    
    @IBOutlet private weak var sliderRedValue: UISlider!
    @IBOutlet private weak var sliderGreenValue: UISlider!
    @IBOutlet private weak var sliderBlueValue: UISlider!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    // MARK: - Private Methods
    private func setupView() {
        textColorLabel.layer.borderColor = UIColor.systemBlue.cgColor
        textColorLabel.layer.borderWidth = 1
        textColorLabel.clipsToBounds = true
        textColorLabel.layer.cornerRadius = 50
    }
    
    // MARK: - IBActions
    @IBAction private func sliderAction(_ sender: Any) {
        self.viewColor.backgroundColor = UIColor(red: CGFloat(sliderRedValue.value) / 255, green: CGFloat(sliderGreenValue.value) / 255, blue: CGFloat(sliderBlueValue.value) / 255, alpha: 1)
        textColorLabel.text = "Color( R: \(Int(sliderRedValue.value)), G: \(Int(sliderGreenValue.value)), B: \(Int(sliderBlueValue.value)))"
    }
}
