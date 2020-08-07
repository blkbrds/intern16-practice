//
//  ProvinceViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol ProvinceViewControllerDelegate {
    func setValueProvinceAndDistrict(_ provinceViewController: ProvinceViewController, needperform action: ProvinceViewController.Action)
}
final class ProvinceViewController: UIViewController {

    // MARK: - Properties
    var getRegion: String = ""
    var nameProvince: String = ""
    var delegate: ProvinceViewControllerDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tỉnh"
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(editDistrictClick))
        navigationItem.rightBarButtonItem = editButton
    }

    @IBAction func chooseProvinceTouchUpInside(_ sender: UIButton) {
        guard let nameProvince1 = sender.titleLabel?.text else { return }
        nameProvince = nameProvince1
        sender.backgroundColor = .green

    }
    // MARK: - Objc
    @objc private func editDistrictClick() {
        let vc = DistrictViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ProvinceViewController {
    enum Action {
        case sendValueProvinceAndDistrict(nameProvince: String, nameDistrict: String)
    }
}
extension ProvinceViewController: DistrictViewControllerDelegate {
    func setValueDistrict(_ districtViewController: DistrictViewController, needperform action: DistrictViewController.Action) {
        switch action {
        case .sendValueDistrict(nameDistrict: let nameDistrict1):
            delegate?.setValueProvinceAndDistrict(self, needperform: .sendValueProvinceAndDistrict(nameProvince: nameProvince, nameDistrict: nameDistrict1))
        }
    }
}
