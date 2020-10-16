//
//  Baitap5ViewController.swift
//  Baitap10Protocol
//
//  Created by MBA0245P on 10/15/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap5ViewController: UIViewController {
    
    var subCalculator = SubCalculator()
    @IBOutlet weak var xTexTField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubCalculatorView()


    }

    func configSubCalculatorView() {
        let window = UIApplication.shared.windows[0]
        let bottomPadding = window.safeAreaInsets.bottom

        guard let newsubCalculator = Bundle.main.loadNibNamed("SubCalculator", owner: self, options: nil)?.first as? SubCalculator else { return }
        subCalculator = newsubCalculator
        subCalculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - bottomPadding - 270, width: UIScreen.main.bounds.width, height: 270)
        subCalculator.layer.borderWidth = 1.0
        subCalculator.layer.borderColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        let border = CALayer()
        border.backgroundColor = #colorLiteral(red: 0.09297447849, green: 0.3600888325, blue: 0.16213688, alpha: 1)
        border.frame = CGRect(x: 0, y: 43, width: UIScreen.main.bounds.width, height: 1.0)
        subCalculator.layer.addSublayer(border)
        view.addSubview(subCalculator)
        subCalculator.isHidden = true
    }

    @IBAction func toggleCalculatorButton(_ sender: UIButton) {
        
        if subCalculator.isHidden {
            subCalculator.isHidden = false
            xTexTField.isEnabled = false
            yTextField.isEnabled = false
        } else {
            subCalculator.isHidden = true
            xTexTField.isEnabled = true
            yTextField.isEnabled = true
        }
    }
    


}
