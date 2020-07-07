//
//  BaiTap2ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/5/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaiTap2ViewController: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    var slider:MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        
        slider?.frame = CGRect(x: 90, y: 200, width: view.frame.width, height: view.frame.height)
        view.addSubview(slider!)
        slider?.delegate = self
        valueTextField.delegate = self
    }
    func changeSlider(num : String){
        slider?.value = (Int(num))
        slider?.setView()
    }
}
extension BaiTap2ViewController : SliderViewDelegate{
    func changeValue(value: Int) {
        valueTextField.text = String(value)
    }
}
extension BaiTap2ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // TODO: return key action
        view.endEditing(true)
        changeSlider(num: valueTextField.text ?? "50")
        return true
    }
}
