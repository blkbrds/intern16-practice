//  BaiTap04
import UIKit

class Bai04ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UILabel!
    @IBOutlet weak var txtGreen: UILabel!
    @IBOutlet weak var txtBlue: UILabel!
    
    @IBOutlet weak var viewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var sliderRedValue: UISlider!
    @IBOutlet weak var sliderGreenValue: UISlider!
    @IBOutlet weak var sliderBlueValue: UISlider!
    
    @IBAction func sliderAction(_ sender: Any) {
        txtGreen.text = String(sliderGreenValue.value)
        txtBlue.text = String(sliderBlueValue.value)
        txtRed.text = String(sliderRedValue.value)
        self.viewColor.backgroundColor = UIColor(red: CGFloat(sliderRedValue.value) / 255, green: CGFloat(sliderGreenValue.value) / 255, blue: CGFloat(sliderBlueValue.value) / 255, alpha: 1)
        txtBlue.text = String("red: \(sliderRedValue.value), green: \(CGFloat(sliderGreenValue.value) / 255), blue: \(CGFloat(sliderBlueValue.value) / 255)")
    }
}
