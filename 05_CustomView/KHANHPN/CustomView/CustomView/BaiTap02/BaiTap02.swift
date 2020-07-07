//
//  BaiTap02.swift
//  CustomView
//
//  Created by PCI0007 on 7/6/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap02: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var valueTextField: UITextField!
    
    let slider = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as? SliderView // add slider
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider?.frame = CGRect(x: 149 , y: 274, width: 116 , height: 523)
        view.addSubview(slider!)
        slider?.delegate = self
        valueTextField.delegate = self
    }
    
    func chageValue(number: Int) {
        let percen = CGFloat(100 - number)
        slider?.grayImageView.frame.size.height = CGFloat (percen * (slider?.blueImageView.frame.size.height)!) / 100
        slider?.thumbView.center.y = CGFloat( (slider?.grayImageView.frame.size.height)!)
        slider?.thumbLabel.text = String(number)
    }
}

extension BaiTap02: SliderViewDelegate {
    func sliderView(_ sliderView: SliderView, didSelect index: Int) {
        valueTextField.text = String(index)
    }
}

extension BaiTap02: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let number = Int(valueTextField.text!)!
        chageValue(number: number)
        return true
    }
}
