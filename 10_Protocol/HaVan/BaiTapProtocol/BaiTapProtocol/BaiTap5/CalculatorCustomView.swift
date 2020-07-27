//
//  CalculatorCustomView.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/26/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol CalculatorCustomViewDatasource: class {
    func getData() -> (x: Float, y: Float)?
}

final class CalculatorCustomView: UIView {
    // MARK: - IBOutlets
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var powerButton: UIButton!
    @IBOutlet private weak var percentButton: UIButton!
    @IBOutlet private weak var  devideButton: UIButton!
    @IBOutlet private weak var multipleButton: UIButton!
    @IBOutlet private weak var minorButton: UIButton!
    @IBOutlet private weak var xValueLabel: UILabel!
    @IBOutlet private weak var yValueLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var controlButtonsView: UIView!
    
    // MARK: - Propeties
    weak var datasource: CalculatorCustomViewDatasource?
    // MARK: - Initialize
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configButton()
        configValue()
    }
    // MARK: - Override functions
    
    // MARK: - Private functions
    private func setInitialStateButton(button: UIButton) {
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.clipsToBounds = true
       
    }
    
    private func configButton() {
        setInitialStateButton(button: plusButton)
        setInitialStateButton(button: minorButton)
        setInitialStateButton(button: devideButton)
        setInitialStateButton(button: powerButton)
        setInitialStateButton(button: multipleButton)
        setInitialStateButton(button: percentButton)
        controlButtonsView.layer.borderWidth = 1
        controlButtonsView.layer.borderColor = UIColor.blue.cgColor
        clearButton.layer.cornerRadius = 15
        
    }
    
    private func changeButtonState(button: UIButton) {
        configButton()
            button.backgroundColor = .orange
            button.setTitleColor(.white, for: .normal)
    }
    
     func configValue() {
        guard let x = getXY()?.x, let y = getXY()?.y else {
            xValueLabel.text = ""
            yValueLabel.text = ""
            return
        }
        xValueLabel.text = String(x)
        yValueLabel.text = String(y)
    }
    
    func getXY() -> (x: Float, y: Float)? {
        guard let result = datasource?.getData() else { return nil }
        return (result.x, result.y)
    }
    // MARK: - Public functions
    
    // MARK: - Objc functions
    
    // MARK: - IBActions
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        changeButtonState(button: sender)
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        
    }
}

// MARK: - Extension
extension CalculatorCustomView {
    enum TransData {
        case transXAndY(x: Float, y: Float)
    }
}


