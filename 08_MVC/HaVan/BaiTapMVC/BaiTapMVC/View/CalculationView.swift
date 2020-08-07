//
//  CalculationView.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

protocol CalculationViewDelegate: class {
    func view(_ view: CalculationView, needsPerform action: CalculationView.Action)
}

protocol CalculationViewDatasource: class {
    func getResult(_ view: CalculationView) -> String?
    func getData(_ view: CalculationView) -> String
}

final class CalculationView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var resultLabel: UILabel!
   
    // MARK: - Properties
    weak var delegate: CalculationViewDelegate?
    weak var datasource: CalculationViewDatasource?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    // MARK: - IBActions
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        delegate?.view(self, needsPerform: .sendNumber(number: number))
        guard let result  = datasource?.getData(self) else { return }
        resultLabel.text = result
    }
    
    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        guard let operation = sender.titleLabel?.text else { return }
        delegate?.view(self, needsPerform: .sendOperator(operator: operation))
    }
    
    @IBAction private func resultButtonTouchUpInside(_ sender: UIButton) {
        guard let result = datasource?.getResult(self) else { return }
        resultLabel.text = result
    }
    
    @IBAction private func deleteButtonTouchUpInside(_ sender: UIButton) {
        resultLabel.text?.removeAll()
        delegate?.view(self, needsPerform: .deleteNumber)
    }
}

// MARK: - Extension
extension CalculationView {
    enum Action {
        case sendOperator(operator: String)
        case sendNumber(number: String)
        case deleteNumber
    }
}
