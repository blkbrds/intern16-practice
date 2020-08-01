//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by bu on 7/30/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var operatorView = Bundle.main.loadNibNamed("OperatorView", owner: self, options: nil)?.last as? OperatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI(){
        title = "Calculator"
        
        operatorView?.frame = CGRect(x: 0, y: view.bounds.height , width: view.bounds.width, height: 307)
        self.view.addSubview(operatorView!)
    }
    
    private func slideUp(){
        UIView.animate(withDuration: 0.5){
            let frame = CGRect(x: 0, y: self.view.bounds.height - 307, width: self.view.bounds.width, height: 307)
            self.operatorView?.frame = frame
        }
    }
    private func slideDown(){
        UIView.animate(withDuration: 0.5) {
            let frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: 307)
            self.operatorView?.frame = frame
        }
    }
    
    @IBAction private func operatorTouchUpInside(_ sender: UIButton) {
        view.endEditing(true)
        number2TextField.resignFirstResponder()
        slideUp()
    }
    
}
