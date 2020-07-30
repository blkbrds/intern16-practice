//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol ProvinceViewControllerDelegate: class {
    func getProvince(_ controller: ProvinceViewController, needsPerform action: ProvinceViewController.Action)
}

class ProvinceViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    var provinceButtons: [UIButton] = []
    var tinhs: [Tinh] = []
    var huyens: [Huyen] = [Huyen]
    var temp: Int = 0
    weak var delegate: ProvinceViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    private func configUI() {
        title = "Tỉnh"
        let districtButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(goToDistrict))
        navigationItem.rightBarButtonItem = districtButton

        for (index, item) in tinhs.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .red
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index + 1
            button.addTarget(self, action: #selector(provinceTouchUpInside), for: .touchUpInside)
            provinceButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    @objc private func goToDistrict() {
        let districtView = DistrictViewController()
        districtView.huyens = tinhs[temp].huyens
        navigationController?.pushViewController(districtView, animated: true)
    }
    @objc func provinceTouchUpInside(_ sender: UIButton) {
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
        for index in 0..<provinceButtons.count {
            provinceButtons[index].backgroundColor = .clear
            provinceButtons[index].setTitleColor(.black, for: .normal)
        }
        provinceButtons[i].backgroundColor = .green
        provinceButtons[i].setTitleColor(.black, for: .normal)
        temp = i
    }
}

extension ProvinceViewController {
    enum Action {
        case saveProvince(provinceName: String)
        case saveProvinceDistrict(provinceName: String, districtName: String)
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func getDistrict(_ controller: DistrictViewController, needsPerform action: DistrictViewController.Action) {
        switch action {
        case .saveDistrict(districtName: let district):
            delegate?.getProvince(self, needsPerform: .saveProvinceDistrict(provinceName: tinhs[temp].name, districtName: district))
        }
    }
}
