//
//  BaiTap08VC.swift
//  BaiTap08
//
//  Created by PCI0020 on 7/7/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

final class BaiTap08VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        guard let calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?[0] as? CalculatorView else { return }
        calculator.frame = CGRect(x: 75, y: 100, width: 300, height: 400)
        view.addSubview(calculator)
    }
}
