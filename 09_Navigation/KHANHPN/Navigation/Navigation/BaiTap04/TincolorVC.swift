//
//  Tincolor.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class TincolorVC: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Feed"
        customBar()
    }
    
    // MARK: - Private function
    private func customBar() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.231372549, green: 0.3490196078, blue: 0.5960784314, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let optionItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
        navigationItem.rightBarButtonItem = optionItem
        navigationItem.leftBarButtonItem = searchItem
    }
}
