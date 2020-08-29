//
//  CustomIcon.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class CustomIcon: UIViewController {
    
    // MARK: - Liffe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customBar()
    }
    
    // MARK: - Private funcion
    private func customBar() {
        title = "Bar Button Test"
        let img = UIImage(named: "sw-rebel-48")!.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: nil)
    }
}
