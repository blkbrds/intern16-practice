// Bai02
// Bai02ViewController.swift

import UIKit

class Bai02ViewController: UIViewController {
    
    @IBOutlet weak var volunmTextField: UITextField!
    
    private var value: Int = 0 {
        didSet {
            volunmTextField.text = String(value)
        }
    }
    
    private let sliderView = SliderView(frame: CGRect(x: 170, y: 100, width: 50, height: 390))
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSliderView()
        
        volunmTextField.text = String(value)
        volunmTextField.delegate = self
        sliderView.frame.size = CGSize(width: 50, height: 400)
        sliderView.center = view.center
        sliderView.delegate = self
        self.view.addSubview(sliderView)
    }
    
    @IBAction func volunmTextFieldAction(_ sender: Any) {
        guard let text = volunmTextField.text, let value = Int(text) else { return }
               self.value = value
               sliderView.isChange = false
               sliderView.value = CGFloat(value)

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
        self.value = Int(value)
    }
}

extension Bai02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
