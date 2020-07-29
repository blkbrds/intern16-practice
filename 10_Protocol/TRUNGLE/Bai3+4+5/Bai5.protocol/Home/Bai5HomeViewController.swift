//
//  Bai5HomeViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 7/28/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

final class Bai5HomeViewController: UIViewController {
    
    @IBOutlet weak var valueXTextField: UITextField!
    @IBOutlet var valueYTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func calPressed(_ sender: Any) {
        guard let calculaterView = Bundle.main.loadNibNamed("CalculatorViewController", owner: self, options: nil)?.first as? CalculatorViewController else { return }
        calculaterView.frame = CGRect(x: 32, y: 300, width: 350, height: 300)
        calculaterView.dataSource = self
        calculaterView.configView()
        calculaterView.delegate = self
        view.addSubview(calculaterView)
    }
}

extension Bai5HomeViewController: CalculatorViewControllerDataSource{
    func getValueX() -> Int? {
        guard let x = valueXTextField.text else { return 0 }
        return Int(x)
    }
    
    func getValueY() -> Int? {
        guard let y = valueYTextField.text else { return 0 }
        return Int(y)
    }
}

extension Bai5HomeViewController: CalculatorViewControllerDelegate {
    func calculateView(view: CalculatorViewController, needPerformAction action: CalculatorViewController.action) {
        switch action {
        case .clearAction(let clearText):
            valueXTextField.text = clearText
            valueYTextField.text = clearText
        case .doneAction(let resultText):
            resultLabel.text = resultText
        }
    }
}

