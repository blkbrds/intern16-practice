//
//  CaculatorUIView.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CaculatorUIViewDelegate: class {
    func sendData(_ view: CaculatorUIView, needsPerform action: CaculatorUIView.Action)
}

protocol CaculatorUIViewDataSource: class {
    func getValueNumber() -> String
    func getResult() -> String
}

final class CaculatorUIView: UIView {

    // MARK: - IBOutlet
    @IBOutlet weak var numberResultLabel: UILabel!
    
    // MARK: - Private properties
    private var operation = 0
    weak var delegate: CaculatorUIViewDelegate?
    weak var datasource: CaculatorUIViewDataSource?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - @IBActions
    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        delegate?.sendData(self, needsPerform: .numBer(number: number))
        guard let numberOnscreen  = datasource?.getValueNumber() else { return }
        numberResultLabel.text = numberOnscreen
    }

    @IBAction private func calButtonTouchUpInside(_ sender: UIButton) {
        guard let action = sender.titleLabel?.text else { return }
        numberResultLabel.text = action
        delegate?.sendData(self, needsPerform: .cal(operator: action))
    }

    @IBAction func handleACButtonTouchUpInside(_ sender: UIButton) {
        numberResultLabel.text?.removeAll()
        delegate?.sendData(self, needsPerform: .clear)
    }

    @IBAction func handleResultButtonTouchUpInside(_ sender: UIButton) {
        guard let result = datasource?.getResult() else { return }
        numberResultLabel.text = result
    }
}

extension CaculatorUIView {
    enum Action {
        case cal(operator: String)
        case numBer(number: String)
        case clear
    }
}
