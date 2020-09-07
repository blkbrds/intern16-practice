//
//  DistrictViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Huyện"
}

// MARK: - Protocol
protocol DistrictViewControllerDelegate: class {
    func setValueDistrict(_ viewController: DistrictViewController, needPerform action: DistrictViewController.Action)
}

final class DistrictViewController: UIViewController {

    // MARK: - Properties
    enum Action {
        case sendValueDistrict(nameDistrict: String)
    }

    weak var delegate: DistrictViewControllerDelegate?
    var getRegion: String = ""
    var getProvince: String = ""
    var nameDistrict: String = ""

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClick))
        navigationItem.rightBarButtonItem = editButton
    }

    @IBAction private func chooseDistrictTouchUpInside(_ sender: UIButton) {
        if let nameDistrict1 = sender.titleLabel?.text {
            nameDistrict = nameDistrict1
            sender.backgroundColor = .orange
        }
    }

    // MARK: - Objc Private Functions
    @objc private func doneClick() {
        if let delegate = delegate {
            delegate.setValueDistrict(self, needPerform: .sendValueDistrict(nameDistrict: nameDistrict))
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
