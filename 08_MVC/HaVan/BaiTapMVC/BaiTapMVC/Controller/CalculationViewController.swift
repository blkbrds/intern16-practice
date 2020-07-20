//
//  CalculationViewController.swift
//  BaiTapMVC
//
//  Created by NganHa on 7/20/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    // MARK: - Properties
    var calculator = CalculationView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    // MARK: - Private functions
    //config view
    private func configView() {
        guard let newCalculator = Bundle.main.loadNibNamed("CalculationView", owner: self, options: nil)?.first as? CalculationView else { return }
        view.addSubview(newCalculator)
    }
}
