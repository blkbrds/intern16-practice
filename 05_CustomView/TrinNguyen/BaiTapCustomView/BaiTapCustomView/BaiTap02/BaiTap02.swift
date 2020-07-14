//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap02: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!

    // MARK: - Properties
    var num: Int?
    var mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Private Methods
    private func configUI() {
        guard let mySliderView = mySliderView else { return }
        mySliderView.frame = CGRect(x: 170, y: 240, width: 76, height: 480)
        view.addSubview(mySliderView)
        mySliderView.delegate = self
        valueTextField.delegate = self
    }

    private func change(num: String) {
        mySliderView?.value = Int(num)
        mySliderView?.setView()
    }
}

// MARK: - MySliderViewDelegate
extension BaiTap02: MySliderViewDelegate {
    func sliderView(_ sliderView: MySliderView, percentInput: Int) {
        valueTextField.text = String(percentInput)
    }
}

// MARK: - UITextFieldDelegate
extension BaiTap02: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        change(num: valueTextField.text ?? "20")
        return true
    }
}
