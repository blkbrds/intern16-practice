//
//  Bai2ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai2ViewController: UIViewController {
    //MARK: - IBOulets
    @IBOutlet private weak var valueTextField: UITextField!
    
    //MARK: - Properties
    var mySliderView = MySliderView()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configSlider()
    }
    
    //MARK: - Private function
    private func configSlider() {
        mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as! MySliderView
        mySliderView.frame = CGRect(x: 120, y: 120, width: view.frame.width, height: view.frame.height)
        mySliderView.delegate = self
        view.addSubview(mySliderView)
        valueTextField.delegate = self
    }
    
    private func updatePercent(num : String){
        mySliderView.value = (Int(num))
        mySliderView.updatePercent()
    }
}

//MARK: - Extension
extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        let check = Int(textField.text!)
        if check! >= 100 {
            updatePercent(num: "100" )
            return true
        } else if check! <= 0 {
            updatePercent(num: "0")
            return true
        } else {
            updatePercent(num: valueTextField.text ?? "60")
            return true
        }
    }
}

extension Bai2ViewController: MySliderViewDelegate {
    func view(view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .updatePercent(let percent):
            valueTextField.text = String(percent)
        }
    }
}
