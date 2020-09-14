//
//  LocationViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Địa Điểm"
}

final class LocationViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInSide))
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Objc Private Functions
    @objc private func editButtonTouchUpInSide() {
        let vc = RegionViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - RegionViewControllerDelegate
extension LocationViewController: RegionViewControllerDelegate {
    func setValueRegionAndProvinceAndDistrict(_ regionViewController: RegionViewController, needPerform action: RegionViewController.Action) {
        switch action {
        case .sendValueRegionAndProvinceAndDistrict(nameRegion: let nameRegion1, nameProvince: let nameProvince1, nameDistrict: let nameDistrict1):
            regionLabel.text = nameRegion1
            provinceLabel.text = nameProvince1
            districtLabel.text = nameDistrict1
        }
    }
}
