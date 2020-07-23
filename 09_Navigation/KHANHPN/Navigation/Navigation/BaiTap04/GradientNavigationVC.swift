//
//  GradientNavigation.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class GradientNavigationVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient Navigation"
        customBar()
    }
    
    func customBar() {
        if let image = UIImage(named: "gradient") {
            navigationController?.navigationBar.setBackgroundImage(image.resizableImage(withCapInsets: .zero, resizingMode: .stretch), for: .default)
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
