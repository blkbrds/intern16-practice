// Bai02
// Bai02ViewController.swift

import UIKit

class Bai02ViewController: UIViewController {
    
    @IBOutlet weak var volunmTextField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSliderView()
    }
    
    // MARK: - Function private
    private func addSliderView() {

        if let sliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as? SliderView {
            sliderView.center = view.center
//            sliderView.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
            sliderView.frame.size = CGSize(width: 189, height: 322)
            view.addSubview(sliderView)
        }
    }
}

// MARK: - Extension
extension Bai02ViewController: SliderViewDelegate {
    func sliderView(value: CGFloat){
        volunmTextField.text = "\(Int(value))"
    }
}
