//
//  CountryViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol CountryViewControllerDelegate: class {
    func controller(_ controller: CountryViewController, needsPerform action: Action)
}

protocol CountryViewControllerDataSource: class {
    func getCountry() -> [Country]
}

final class CountryViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var stackView: UIStackView!

    // MARK: - Function
    private var countryButtons: [UIButton] = []
    private var countries: [Country] = []
    weak var delegate: CountryViewControllerDelegate?
    weak var dataSource: CountryViewControllerDataSource?
    private var selectedIndex = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Function
    private func configUI() {
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(goToProvinceVC))
        navigationItem.rightBarButtonItem = provinceButton
        
        if let dataSource = dataSource {
            countries = dataSource.getCountry()
        }
        
        for (index, item) in countries.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(countryTouchUpInside), for: .touchUpInside)
            countryButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Objc
    @objc private func goToProvinceVC(_ sender: UIButton) {
        let provinceView = ProvinceViewController()
        provinceView.delegate = self
        provinceView.dataSource = self
        navigationController?.pushViewController(provinceView, animated: true)
    }
    
    @objc private func countryTouchUpInside(_ sender: UIButton) {
        countryButtons.forEach { button in
            button.backgroundColor = .gray
        }
        sender.backgroundColor = .red
        delegate?.controller(self, needsPerform: .sendCountry(countries[sender.tag].name))
        selectedIndex = sender.tag
    }
}

// MARK: - Extension Delegate
extension CountryViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, needsPerform action: Action) {
        switch action {
        case .sendProvince(let province):
            delegate?.controller(self, needsPerform: .sendProvince(province))
        case .sendDictrict(let district):
            delegate?.controller(self, needsPerform: .sendDictrict(district))
        default:
            break
        }
    }
    
}

// MARK: - Extension DataSource
extension CountryViewController: ProvinceViewControllerDataSource {
    func getProvince() -> [Province] {
        return countries[selectedIndex].provinces
    }
}
