//
//  DistrictViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class DistrictViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!

    var districtButtons: [UIButton] = []
    var huyens: [Huyen] = []
//    var newCountry: String = ""
//    var newProvince: String = ""
//    var district: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Huyện"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goToLocation))
        navigationItem.rightBarButtonItem = doneButton
        
        for (index, item) in huyens.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .red
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index + 1
            button.addTarget(self, action: #selector(districtTouchUpInside), for: .touchUpInside)
            districtButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func goToLocation() {
        let vc = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(vc, animated: true)
        
    }
    
    private func resetButton() {
        for index in 0..<districtButtons.count {
            districtButtons[index].backgroundColor = .clear
            districtButtons[index].setTitleColor(.black, for: .normal)
        }
    }
    
    @IBAction func districtTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            resetButton()
            chooseButtonTouchUpInSide(i: 0)
        case 2:
            resetButton()
            chooseButtonTouchUpInSide(i: 1)
        case 3:
            resetButton()
            chooseButtonTouchUpInSide(i: 2)
        case 4:
            resetButton()
            chooseButtonTouchUpInSide(i: 3)
        case 5:
            resetButton()
            chooseButtonTouchUpInSide(i: 4)
        case 6:
            resetButton()
            chooseButtonTouchUpInSide(i: 5)
        case 7:
            resetButton()
            chooseButtonTouchUpInSide(i: 6)
        case 8:
            resetButton()
            chooseButtonTouchUpInSide(i: 7)
        case 9:
            resetButton()
            chooseButtonTouchUpInSide(i: 8)
        case 10:
            resetButton()
            chooseButtonTouchUpInSide(i: 9)
        default:
            print("Error")
        }
    }
    
    func chooseButtonTouchUpInSide(i: Int) {
        districtButtons[i].backgroundColor = .blue
        districtButtons[i].setTitleColor(.white, for: .normal)
        
//        district = "Huyện \(i + 1)"
        
    }
}
//
//extension DistrictViewController: LocationViewControllerDataSource {
//    func getCountry() -> String {
////        return newCountry
//    }
//
//    func getProvince() -> String {
////        return newProvince
//    }
//
//    func getDistrict() -> String {
////        return district
//    }
    
    
//}
