//
//  BaiTap03VC.swift
//  BaiTap05
//
//  Created by hieungq on 7/5/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap03VC: UIViewController {

    @IBOutlet weak var valueTextfield: UITextField!
    var valueSlider:Int = 50
    let sliderView = SliderView(frame: CGRect(x: 100, y: 250, width: 150, height: 500), value: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextfield.text = "50"
        valueSlider = Int(valueTextfield.text!)!
        sliderView.delegate = self
        valueTextfield.delegate = self
        view.addSubview(sliderView)
    }
   /// 123123
    
}
extension BaiTap03VC: SliderViewDelegate {
    func sendValue(_ view: UIView, _ value: Int) {
        valueTextfield.text = String(value)
    }
}
extension BaiTap03VC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        valueSlider = Int(valueTextfield.text!)!
        
        if valueSlider > 100 || valueSlider < 0 {
            valueTextfield.text = ""
            return true
        }
        sliderView.thumbSlider.center.y = sliderView.backgroundSlider.frame.size.height * (100 - CGFloat(valueSlider)) / 100
        sliderView.valueSlider.frame.size.height = sliderView.thumbSlider.center.y
        sliderView.numberLabel.text = String(valueSlider)
        print( sliderView.thumbSlider.frame.origin.y )
        
        valueTextfield.endEditing(true)
        return true
    }
}
