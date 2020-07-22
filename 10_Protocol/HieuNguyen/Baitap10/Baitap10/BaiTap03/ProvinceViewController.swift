//
//  ProvinceViewController.swift
//  Baitap10
//
//  Created by hieungq on 7/12/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class ProvinceViewController: UIViewController {
    
    @IBOutlet weak var verticalStackButton: UIStackView!
    var location: Location = Location(region: nil, province: nil, district: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tỉnh"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupButton()
    }
    
    @IBAction private func provinceButtonTouchUpInside(_ sender: Any) {
        changeButtonSelected(index: (sender as AnyObject).tag)
    }
    
    @objc private func nextToDisTrictViewController() {
        let districtViewController = DistrictViewController()
        districtViewController.location = location
        navigationController?.pushViewController(districtViewController, animated: true)
    }

    private func setupButton() {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location.province {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                }
            }
            button.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
        let rightButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(nextToDisTrictViewController))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func changeButtonSelected(index: Int) {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location.province {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
            if button.tag == index {
                button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            }
        }
        location.province = String(index)
    }
}
