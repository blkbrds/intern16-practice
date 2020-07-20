//  CalculatorViewController.swift
//  MVC
import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var digitLabel: UILabel!
    var isDigitInLabel: Bool = false
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func numberButtonAction(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let numberInput = digitLabel.text!
        if digit == "0" && numberInput == "0" {
            digitLabel.text = "0"
        } else {
            digitLabel.text = numberInput + digit
        }
        isDigitInLabel = true
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        digitLabel.text = "0"
    }

    @IBAction func operatorButtonAction(_ sender: UIButton) {
        // digitLabel.text =
    }
}
