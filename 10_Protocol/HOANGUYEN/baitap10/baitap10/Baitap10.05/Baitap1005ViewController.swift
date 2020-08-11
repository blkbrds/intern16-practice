//
//  Baitap1005ViewController.swift
//  baitap10
//
//  Created by NXH on 7/23/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap1005ViewController: UIViewController {
    
    // MARK: -@IBoutlet
    @IBOutlet private weak var xTextField: UITextField!
    @IBOutlet private weak var yTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var operatorButton: UIButton!
    
    // MARK: - Properties
    private var custom: CustomView = CustomView()
    
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private Func
    private func configUI() {
        yTextField.delegate = self
        xTextField.delegate = self
        guard let customView: CustomView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as? CustomView else { return }
        custom = customView
        view.addSubview(custom)
        custom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([custom.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                                     custom.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
                                     custom.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
                                     custom.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        custom.delegate = self
        custom.dataSource = self
    }
    
    // MARK: - @IBAction
    @IBAction func operatorButtonTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.custom.frame.origin.y = UIScreen.main.bounds.height -  self.custom.frame.height
        }
    }
}

// MARK: - extension
extension Baitap1005ViewController: CustomViewDelegate {
    func view(_ view: CustomView, needsPerform action: CustomView.Action) {
        switch action {
        case .tapOnDoneButton:
            guard let result = result else {
                return
            }
            resultLabel.text = String(result.clean)
        case .tapOnClear:
            xTextField.text = nil
            yTextField.text = nil
            resultLabel.text = nil
        }
    }
    
}

extension Baitap1005ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = Int(textField.text!) {
            if textField.tag == 1 {
                xTextField.text = String(text)
                yTextField.becomeFirstResponder()
            } else {
                yTextField.text = String(text)
                view.endEditing(true)
            }
            custom.getXY()
        }
        return true
    }
}

extension Baitap1005ViewController: CustomViewDataSource {
    func getXY() -> (x: Float, y: Float)? {
        guard let xResult = Float(xTextField.text!), let yResult = Float(yTextField.text!) else {
            return nil
        }
        return (xResult, yResult)
    }
}
