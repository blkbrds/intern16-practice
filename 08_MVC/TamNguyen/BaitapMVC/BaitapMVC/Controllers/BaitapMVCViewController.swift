//
//  BaitapMVCViewController.swift
//  BaitapMVC
//
//  Created by PCI0001 on 7/20/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class BaitapMVCViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCaculator()
    }
    
    //MARK: - Private methods
    private func configCaculator() {
        guard let calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?[0] as? CalculatorView else { return }
        calculator.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.addSubview(calculator)
    }
}   
