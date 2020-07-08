//
//  Bai2ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
   
 let slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView // add slider
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider?.frame = CGRect(x: 149 , y: 274, width: 116 , height: 523)
        view.addSubview(slider!)
        slider?.delegate = self
        valueTextField.delegate = self
    }

    func changeValue(number: Int) {
        let percent = CGFloat(100 - number)
        slider?.grayImageView.frame.size.height = CGFloat (percent * (slider?.blueImageView.frame.size.height)!) / 100
        slider?.valueLabel.center.y = CGFloat( (slider?.grayImageView.frame.size.height)!)
        slider?.valueLabel.text = String(number)
    }
}

extension Bai2ViewController: SliderViewDelegate {
    func sliderView(_ sliderView: MySliderView, didSelect index: Int) {
        valueTextField.text = String(index)
    }
}

extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let number = Int(valueTextField.text!)!
        changeValue(number: number)
        return true
    }
}
