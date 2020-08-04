//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol ProvinceViewControllerDelegate: class {
    func controller(_ controller: ProvinceViewController, needsPerform action: Action)
}
protocol  ProvinceViewControllerDataSource: class {
    func getProvince() -> [Province]
}

class ProvinceViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var stackView: UIStackView!

    // MARK: - Properties
    private var provinceButtons: [UIButton] = []
    private var provinces: [Province] = []
    weak var delegate: ProvinceViewControllerDelegate?
    weak var dataSource: ProvinceViewControllerDataSource?
    private var selectedIndex = 0

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Tỉnh"
        let districtButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(goToDistrict))
        navigationItem.rightBarButtonItem = districtButton
        
        if let dataSource = dataSource {
            provinces = dataSource.getProvince()
        }

        for (index, item) in provinces.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(provinceTouchUpInside), for: .touchUpInside)
            provinceButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Objc
    @objc private func goToDistrict(_ sender: UIButton) {
        let districtVC = DistrictViewController()
        districtVC.delegate = self
        districtVC.dataSoure = self
        navigationController?.pushViewController(districtVC, animated: true)
    }
    
    @objc private func provinceTouchUpInside(_ sender: UIButton) {
        provinceButtons.forEach { button in
            button.backgroundColor = .gray
        }
        sender.backgroundColor = .blue
        delegate?.controller(self, needsPerform: .sendProvince(provinces[sender.tag].name))
    }
}

// MARK: - Extension Delegate
extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, needsPerform action: Action) {
        switch action {
        case .sendDictrict(let district):
            delegate?.controller(self, needsPerform: .sendDictrict(district))
        default:
            break
        }
    }
}

// MARK: - Extension Datasource
extension ProvinceViewController: DistrictViewControllerDataSource {
    func getDistrict() -> [District] {
        guard selectedIndex < provinces.count else { return [] }
        return provinces[selectedIndex].districts
    }
}
