//
//  LocationViewController.swift
//  BaiTapProtocol
//
//  Created by PCI0004 on 7/24/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class LocationViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        editRightButton()
    }

    // MARK: - Private Functions
    private func editRightButton() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClick))
        navigationItem.rightBarButtonItem = editButton
    }
    // MARK: - Objc
    @objc private func editClick() {
        let vc = RegionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }



}
