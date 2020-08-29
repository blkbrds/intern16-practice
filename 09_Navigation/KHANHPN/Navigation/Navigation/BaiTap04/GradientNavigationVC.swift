//
//  GradientNavigation.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class GradientNavigationVC: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient Navigation"
        customBar()
    }
    
    // MARK: - Private func
    private func customBar() {
        if let image = UIImage(named: "gradient") {
            navigationController?.navigationBar.setBackgroundImage(image.resizableImage(withCapInsets: .zero, resizingMode: .stretch), for: .default)
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
