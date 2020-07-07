//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!
    var num: Int?

    var slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView

    override func viewDidLoad() {
        super.viewDidLoad()

        slider?.frame = CGRect(x: 140, y: 200, width: 76, height: 480)
        view.addSubview(slider!)
        slider?.delegate = self
        valueTextField.delegate = self
    }

    func change(num: String) {
        slider?.value = Int(num)
        slider?.setView()
    }

}
extension ViewController: MySliderViewDelegate {
    func sliderView(_ sliderView: MySliderView, didSelcect: Int) {
        valueTextField.text = String(didSelcect)
    } }

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        change(num: valueTextField.text ?? "20")
        return true
    }
}

