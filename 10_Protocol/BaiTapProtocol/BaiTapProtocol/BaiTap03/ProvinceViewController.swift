//
//  ProvinceViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Tỉnh"
}

protocol ProvinceViewControllerDelegate: class {
    func setValueProvinceAndDistrict(_ viewController: ProvinceViewController, needPerform action: ProvinceViewController.Action)
}

final class ProvinceViewController: UIViewController {

    // MARK: - Properties
    var getRegion: String = ""
    var nameProvince: String = ""
    weak var delegate: ProvinceViewControllerDelegate?

    enum Action {
        case sendValueProvinceAndDistrict(nameProvince: String, nameDistrict: String)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(editDistricTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    @IBAction private func chooseProvinceTouchUpInside(_ sender: UIButton) {
        if let nameProvince1 = sender.titleLabel?.text {
            nameProvince = nameProvince1
            sender.backgroundColor = .green
        }
    }

    // MARK: - Objc Private Functions
    @objc private func editDistricTouchUpInside() {
        let vc = DistrictViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - DistrictViewControllerDelegate
extension ProvinceViewController: DistrictViewControllerDelegate {
    func setValueDistrict(_ districtViewController: DistrictViewController, needPerform action: DistrictViewController.Action) {
        switch action {
        case .sendValueDistrict(nameDistrict: let nameDistrict1):
            if let delegate = delegate {
                delegate.setValueProvinceAndDistrict(self, needPerform: .sendValueProvinceAndDistrict(nameProvince: nameProvince, nameDistrict: nameDistrict1))
            }
        }
    }
}
