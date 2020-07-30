//
//  CountryViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol CountryViewControllerDelegate: class {
    func getCountry(_ controller: CountryViewController, needsPerform action: CountryViewController.Action)
}

class CountryViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    var countryButtons: [UIButton] = []
    var miens: [Mien] = []
    var temp: Int = 0
    weak var delegate: CountryViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    private func configUI() {
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(goToProvinceVC))
        navigationItem.rightBarButtonItem = provinceButton

        for (index, item) in miens.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .red
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index + 1
            button.addTarget(self, action: #selector(countryTouchUpInside), for: .touchUpInside)
            countryButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    @objc private func goToProvinceVC() {
        let provinceView = ProvinceViewController()
        provinceView.tinhs = DataManagement.miens[temp].tinhs
        // provinceView.newCountry = country
        navigationController?.pushViewController(provinceView, animated: true)
    }
    @objc func countryTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            setupButton(i: 0)
        case 2:
            setupButton(i: 1)
        case 3:
            setupButton(i: 2)
        case 4:
            setupButton(i: 3)
        case 5:
            setupButton(i: 4)
        case 6:
            setupButton(i: 5)
        case 7:
            setupButton(i: 6)
        case 8:
            setupButton(i: 7)
        case 9:
            setupButton(i: 8)
        case 10:
            setupButton(i: 9)
        default:
            print("Error")
        }
    }

    func setupButton(i: Int) {
        for index in 0..<countryButtons.count {
            countryButtons[index].backgroundColor = .clear
            countryButtons[index].setTitleColor(.black, for: .normal)
        }
        countryButtons[i].backgroundColor = .red
        countryButtons[i].setTitleColor(.white, for: .normal)
        temp = i
    }
}

extension CountryViewController {
    enum Action {
        case saveCountry(countryName: String)
        case saveCountryProvineDictrict(countryName: String, provinceName: String, districtName: String)
    }
}

extension CountryViewController: ProvinceViewControllerDelegate {
    func getProvince(_ controller: ProvinceViewController, needsPerform action: ProvinceViewController.Action) {
        switch action {
        case .saveProvince(provinceName: _):
            break
        case .saveProvinceDistrict(provinceName: let province, districtName: let district):
            delegate?.getCountry(self, needsPerform: .saveCountryProvineDictrict(countryName: miens[temp].name, provinceName: province, districtName: district))
        }
    }
}
