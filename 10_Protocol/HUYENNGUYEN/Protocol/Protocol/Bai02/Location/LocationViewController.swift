//
//  LocationViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

enum Action {
    case sendCountry(String)
    case sendProvince(String)
    case sendDictrict(String)
}

final class LocationViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    // MARK: - Function
    private func configUI() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    // MARK: - Objc
    @objc private func editButtonTouchUpInside(_ sender: UIButton) {
        let countryView = CountryViewController()
        countryView.delegate = self
        countryView.dataSource = self
        navigationController?.pushViewController(countryView, animated: true)
    }
}

// MARK: - Extension Delegate
extension LocationViewController: CountryViewControllerDelegate {
    func controller(_ controller: CountryViewController, needsPerform action: Action) {
        switch action {
        case .sendCountry(let country):
            countryLabel.text = country
        case .sendProvince(let province):
            provinceLabel.text = province
        case .sendDictrict(let district):
            districtLabel.text = district
        }
    }
}

// MARK: - Extension DataSource
extension LocationViewController: CountryViewControllerDataSource {
    func getCountry() -> [Country] {
        return DataManagement.countries
    }
}
