//  CalculatorViewController.swift
//  MVC
import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet private weak var digitLabel: UILabel!
    
    //MARK: - Properties
    private var isDigitInLabel: Bool = false
    private var previousNumber: Double = 0
    private var numberOnLabel: Double = 0
    private var operation = 0
    
    private var displayValue: Double {
        get {
            return Double(digitLabel.text!)!
        }
        set {
            if Double(Int(newValue)) == newValue {
                digitLabel.text = String(Int(newValue))
            }else {
                digitLabel.text = String(newValue)
            }
        }
    }
    
    private var brain = CalculatorBrain()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func numberButtonAction(_ sender: UIButton) {
        if isDigitInLabel == true {
            if sender.currentTitle == "0" && digitLabel.text! == "0" {
                digitLabel.text = "0"
            }
            else {
                digitLabel.text = digitLabel.text! + sender.currentTitle!
            }
        } else {
            digitLabel.text = sender.currentTitle
            isDigitInLabel = true
        }
    }
    
    @IBAction private func deleteButtonAction(_ sender: UIButton) {
        digitLabel.text = "0"
    }
    
    @IBAction private func operatorButtonAction(_ sender: UIButton) {
        if isDigitInLabel {
            brain.setOpera(displayValue)
            isDigitInLabel = false
        }
        
        brain.performOperation(sender.currentTitle!)
        
        if let result = brain.result {
            displayValue = result
        }
    }
}
