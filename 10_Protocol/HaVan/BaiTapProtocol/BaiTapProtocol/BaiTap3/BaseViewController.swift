//
//  BaseViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 8/13/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Public functions
    func configButton(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
    }
    
    func changeButtonState(button: UIButton) {
        button.setTitleColor(.white, for: .normal)
    }
    
    func configButtons() {
    }
}
