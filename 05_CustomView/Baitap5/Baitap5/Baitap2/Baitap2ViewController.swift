//
//  Baitap2ViewController.swift
//  Baitap5
//
//  Created by MBA0245P on 7/18/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap2ViewController: UIViewController {
    
    var customSlider: CustomSiderView = CustomSiderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let newdSlider = (Bundle.main.loadNibNamed("CustomSliderView", owner: nil, options: nil)?.first as? CustomSiderView) else { return }
        customSlider = newdSlider
         view.addSubview(customSlider)
        //customSlider.delegate = self
    }


       

    

}
