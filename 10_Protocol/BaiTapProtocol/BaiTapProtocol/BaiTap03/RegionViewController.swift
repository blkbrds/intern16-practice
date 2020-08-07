//
//  RegionViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

protocol RegionViewControllerDelegate {
    func setValueRegionAndProvinceAndDistrict(_ regionViewController: RegionViewController, needperform action: RegionViewController.Action)
}

final class RegionViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var mienButton: UIButton!
    // MARK: - Properties
    var nameRegion: String = ""
    var delegate: RegionViewControllerDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Miền"
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(editProvinceClick))
        navigationItem.rightBarButtonItem = editButton
    }


    @IBAction func chooseTouchUpInside(_ sender: UIButton) {
        
        guard let nameRegion1 = sender.titleLabel?.text else { return }
        nameRegion = nameRegion1
        sender.backgroundColor = .blue
    }

    // MARK: - Objc
    @objc private func editProvinceClick() {
        let vc = ProvinceViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension RegionViewController {
    enum Action {
        case sendValueRegionAndProvinceAndDistrict(nameRegion: String, nameProvince: String, nameDistrict: String)
    }
}
extension RegionViewController: ProvinceViewControllerDelegate {
    func setValueProvinceAndDistrict(_ provinceViewController: ProvinceViewController, needperform action: ProvinceViewController.Action) {
        switch action {
        case .sendValueProvinceAndDistrict(nameProvince: let nameProvince1, nameDistrict: let nameDistrict1):
            delegate?.setValueRegionAndProvinceAndDistrict(self, needperform: .sendValueRegionAndProvinceAndDistrict(nameRegion: nameRegion, nameProvince: nameProvince1, nameDistrict: nameDistrict1))
        }

    }
}

