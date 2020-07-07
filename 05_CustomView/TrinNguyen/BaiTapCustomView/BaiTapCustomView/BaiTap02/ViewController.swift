//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!

    // MARK: Propeties
    var num: Int?
    var slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen()
    }

    // MARK: Private Methods
    private func configScreen() {
        slider?.frame = CGRect(x: 170, y: 240, width: 76, height: 480)
        view.addSubview(slider!)
        slider?.delegate = self
        valueTextField.delegate = self
    }

    private func change(num: String) {
        slider?.value = Int(num)
        slider?.setView()
    }
}

// MARK: - MySliderViewDelegate
extension ViewController: MySliderViewDelegate {
    func sliderView(_ sliderView: MySliderView, didSelcect: Int) {
        valueTextField.text = String(didSelcect)
    } }

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        change(num: valueTextField.text ?? "20")
        return true
    }
}
