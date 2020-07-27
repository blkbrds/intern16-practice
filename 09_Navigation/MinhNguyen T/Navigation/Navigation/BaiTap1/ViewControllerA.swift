//
//  ViewControllerA.swift
//  Navigation
//
//  Created by MacBook Pro on 7/20/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class ViewControllerA: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    // MARK: - IBActions
    @IBAction private func pushViewTouchUpInside(_ sender: UIButton) {
        let nextUI = ViewControllerB()
        self.navigationController?.pushViewController(nextUI, animated: true)
    }
}
