//
//  LocationViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func editAction() {
        let countryView = CountryViewController()
        countryView.miens = DataManagement.miens
        navigationController?.pushViewController(countryView, animated: true)
    }
}

extension LocationViewController: CountryViewControllerDelegate {
    func getCountry(_ controller: CountryViewController, needsPerform action: CountryViewController.Action) {
        switch action {
        case .saveCountry(countryName: _):
            break
        case .saveCountryProvineDictrict(countryName: let country, provinceName: let province, districtName: let district):
            countryLabel.text = country
            provinceLabel.text = province
            districtLabel.text = district
        }
    }
}
