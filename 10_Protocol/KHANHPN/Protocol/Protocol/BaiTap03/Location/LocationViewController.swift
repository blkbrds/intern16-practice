//
//  LocationViewController.swift
//  Protocol
//
//  Created by PCI0007 on 7/24/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class LocationViewController: UIViewController {
    
    // MARK: -OBOutlet
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configBar()
    }

    // MARK: - Private functions
    private func configBar() {
        title = "Địa điểm"
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Chỉnh sửa", style: .plain, target: self, action: #selector(nextPage))
        backgroundView.layer.cornerRadius = 20
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Actions
    @objc private func nextPage() {
        let region = RegionViewController()
        region.delegate = self
        navigationController?.pushViewController(region, animated: true)
    }
}

// MARK: - Extensions
extension LocationViewController: RegionViewDelegate {
    func regionController(_ viewController: RegionViewController, action: RegionViewController.Action) {
        switch action {
        case .regionData(region: _): break
        case .regionAndProviceAndDistrictData(region: let region, provice: let provice, district: let district):
            regionLabel.text = region
            provinceLabel.text = provice
            districtLabel.text = district
        }
    }
}
