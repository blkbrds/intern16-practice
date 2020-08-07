//
//  DistrictViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol DistrictViewControllerDelegate {
    func setValueDistrict(_ districtViewController: DistrictViewController, needperform action: DistrictViewController.Action)
}

final class DistrictViewController: UIViewController {

    // MARK: - Properties
    var delegate: DistrictViewControllerDelegate?
    var getRegion: String = ""
    var getProvince: String = ""
    var nameDistrict: String = ""


    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Huyện"
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClick))
        navigationItem.rightBarButtonItem = editButton
    }
    @IBAction func chooseDistrictTouchUpInside(_ sender: UIButton) {
        guard let nameDistrict1 = sender.titleLabel?.text else { return }
        nameDistrict = nameDistrict1
        sender.backgroundColor = .orange
    }

    // MARK: - Objc
    @objc private func doneClick() {
        delegate?.setValueDistrict(self, needperform: .sendValueDistrict(nameDistrict: nameDistrict))
        navigationController?.popToRootViewController(animated: true)
    }
}
extension DistrictViewController {
    enum Action {
        case sendValueDistrict(nameDistrict: String)
    }
}

