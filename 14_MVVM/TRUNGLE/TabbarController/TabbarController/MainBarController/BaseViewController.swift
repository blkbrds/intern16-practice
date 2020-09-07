//
//  BaseViewController.swift
//  TabbarController
//
//  Created by Abcd on 8/19/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    //MARK: - Function
    func setupUI(){}
    func setupData(){}
}
