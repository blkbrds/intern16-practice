//  CalculatorViewController.swift
//  MVC
import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var digitLabel: UILabel!
    var isDigitInLabel: Bool = false
    var previousNumber: Double = 0
    var numberOnLabel: Double = 0
    var operation = 0
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numberButtonAction(_ sender: UIButton) {
        if isDigitInLabel == true {
            digitLabel.text = String(sender.tag)
            numberOnLabel = Double(digitLabel.text!)!
            isDigitInLabel = false
        } else {
            digitLabel.text = digitLabel.text! +  String(sender.tag)
            numberOnLabel = Double(digitLabel.text!)!
        }
        //        let digit = sender.currentTitle!
        //        let numberInput = digitLabel.text!
        //        if digit == "0" && numberInput == "0" {
        //            digitLabel.text = "0"
        //        } else {
        //            digitLabel.text = numberInput + digit
        //        }
        //        isDigitInLabel = true
        //        numberOnLabel = Double(digitLabel.text!)!
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        digitLabel.text = "0"
        previousNumber = 0
        numberOnLabel = 0
        operation = 0
    }
    
    @IBAction func operatorButtonAction(_ sender: UIButton) {
        // digitLabel.text =
        //previousNumber = Double(digitLabel.text!)!
        if sender.tag != 11 && sender.tag != 16 && digitLabel.text != "" {
            previousNumber = Double(digitLabel.text!)!
            if sender.tag == 12 {
                digitLabel.text = digitLabel.text! + ":"
                operation = 1
            }
            if sender.tag == 13 {
                digitLabel.text = digitLabel.text! + "+"
                operation = 2
            }
            if sender.tag == 14 {
                digitLabel.text = digitLabel.text! + "-"
                operation = 3
            }
            if sender.tag == 15 {
                //sender.currentTitle
                digitLabel.text = digitLabel.text! + "x"
                operation = 4
            }
            isDigitInLabel = true
        } else {
            if sender.tag == 11 {
                switch operation {
                case 1:
                     digitLabel.text = String(previousNumber / numberOnLabel)
                case 2:
                    digitLabel.text = String(previousNumber + numberOnLabel)
                case 3:
                    digitLabel.text = String(previousNumber - numberOnLabel)
                default:
                     digitLabel.text = String(previousNumber * numberOnLabel)
                }
            }
        }
    }
}
