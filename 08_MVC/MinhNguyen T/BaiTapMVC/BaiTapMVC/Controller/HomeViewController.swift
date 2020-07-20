//
//  HomeViewController.swift
//  BaiTapMVC
//
//  Created by MacBook Pro on 7/17/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calculator = Bundle.main.loadNibNamed("CaculatorUIView", owner: self, options: nil)?[0] as? CaculatorUIView else { return }
        calculator.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.addSubview(calculator)
    }
}
