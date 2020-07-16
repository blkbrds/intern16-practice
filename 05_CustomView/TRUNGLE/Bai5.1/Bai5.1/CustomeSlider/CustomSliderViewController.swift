//
//  CustomeSliderViewController.swift
//  Bai5.1
//
//  Created by Trung Le D. on 7/7/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

final class CustomSliderViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet private weak var value: UITextField!
    //MARK: - Properties
    var mySliderView = MySliderView()
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    //MARK: - Private function
    private func configUI() {
        mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as! MySliderView
        mySliderView.frame = CGRect(x: 120, y: 120, width: view.frame.width, height: view.frame.height)
        mySliderView.delegate = self
        view.addSubview(mySliderView)
        value.delegate = self
    }
    private func updatePercent(num : String){
        mySliderView.value = (Int(num))
        mySliderView.updatePercent()
    }
}
//MARK: - UITextFieldDelegate
extension CustomSliderViewController: UITextFieldDelegate {
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
            updatePercent(num: value.text ?? "60")
            return true
        }
    }
}
//MARK: - MySliderViewDelegate
extension CustomSliderViewController: MySliderViewDelegate {
    func view(view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .updatePercent(let percent):
            value.text = String(percent)
        }
    }
}
