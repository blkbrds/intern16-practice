//
//  RegionViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Miền"
}

protocol RegionViewControllerDelegate: class {
    func setValueRegionAndProvinceAndDistrict(_ viewController: RegionViewController, needPerform action: RegionViewController.Action)
}

final class RegionViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var mienButton: UIButton!

    // MARK: - Properties
    var nameRegion: String = ""
    weak var delegate: RegionViewControllerDelegate?

    enum Action {
        case sendValueRegionAndProvinceAndDistrict(nameRegion: String, nameProvince: String, nameDistrict: String)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(editProvinceTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    @IBAction private func chooseTouchUpInside(_ sender: UIButton) {
        if let nameRegion1 = sender.titleLabel?.text {
            nameRegion = nameRegion1
            sender.backgroundColor = .blue
        }
    }

    // MARK: - Objc
    @objc private func editProvinceTouchUpInside() {
        let vc = ProvinceViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - ProvinceViewControllerDelegate
extension RegionViewController: ProvinceViewControllerDelegate {
    func setValueProvinceAndDistrict(_ provinceViewController: ProvinceViewController, needPerform action: ProvinceViewController.Action) {
        switch action {
        case .sendValueProvinceAndDistrict(nameProvince: let nameProvince1, nameDistrict: let nameDistrict1):
            delegate?.setValueRegionAndProvinceAndDistrict(self, needPerform: .sendValueRegionAndProvinceAndDistrict(nameRegion: nameRegion, nameProvince: nameProvince1, nameDistrict: nameDistrict1))
        }

    }
}

