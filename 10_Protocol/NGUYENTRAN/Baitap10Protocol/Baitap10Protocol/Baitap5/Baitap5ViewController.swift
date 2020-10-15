//
//  Baitap5ViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let subCalculator = Bundle.main.loadNibNamed("SubCalculator", owner: self, options: nil)?.first as? SubCalculator else { return }
        subCalculator.layer.borderColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        subCalculator.layer.borderWidth = 1.0
        view.addSubview(subCalculator)
    }


    

}
