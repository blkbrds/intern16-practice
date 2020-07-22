//
//  Bai2ViewController.swift
//  Bai6
//
//  Created by PCI0001 on 7/10/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        let circle = chartCircle(frame: CGRect(x: 130, y: 250, width: 100, height: 50))
        view.addSubview(circle)
        view.backgroundColor = .white
    }
}
