//
//  RegionViewController.swift
//  Baitap10
//
//  Created by hieungq on 7/11/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

    @IBOutlet weak var verticalStackButton: UIStackView!
    var location: Location = Location(region: nil, province: nil, district: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Miền"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupButton()
    }
    
    @IBAction private func regionButtonTouchUpInside(_ sender: Any) {
        changeButtonSelected(index: (sender as AnyObject).tag)
    }
    
    @objc func nextToProvinceViewController() {
        let provinceViewController = ProvinceViewController()
        provinceViewController.location = location
        navigationController?.pushViewController(provinceViewController, animated: true)
    }
    
    private func setupButton() {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location.region {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
                }
            }
            button.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
        let rightButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(nextToProvinceViewController))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func changeButtonSelected(index: Int) {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location.region {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
            if button.tag == index {
                button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            }
        }
        location.region = String(index)
    }
}

