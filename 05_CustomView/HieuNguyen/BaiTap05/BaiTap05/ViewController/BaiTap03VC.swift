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
    var valueSlider:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextfield.text = "50"
        valueSlider = Int(valueTextfield.text!)
        let sliderView = SliderView(frame: CGRect(x: 150, y: 250, width: 50, height: 500), value: valueSlider)
        sliderView.delegate = self
        view.addSubview(sliderView)
    }
   /// 123123
    
}
extension BaiTap03VC: SliderViewDelegate {
    func sendValue(_ view: UIView, _ value: Int) {
        valueTextfield.text = String(value)
    }
    
    
}
