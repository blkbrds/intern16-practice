//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by PCI0007 on 7/24/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol ProvinceViewDelegate: class {
    func provinceController(_ viewController: ProvinceViewController, action: ProvinceViewController.Action)
}

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var provinceButtons: [UIButton]!
    
    // MARK: - Properties
    var currentButton = UIButton()
    weak var delegate: ProvinceViewDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configBar()
        customButton()
    }
    
    // MARK: - Private functions:
    private func configBar() {
        title = "Tỉnh"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(nextPage))
    }
    
    private func customButton() {
        for i in 1..<provinceButtons.count {
            provinceButtons[i].layer.cornerRadius = 10
        }
    }
    
    // MARK: - Actions
    @IBAction func provinceTouchUpInside(_ sender: UIButton) {
        if currentButton != sender {
            currentButton.backgroundColor = .systemGray6
            sender.backgroundColor = .green
            currentButton = sender
        }
    }
    
    @objc func nextPage() {
        let next = DistrictViewController()
        next.delegate = self
        navigationController?.pushViewController(next, animated: true)
    }
}

// MARK: - Extensions
extension ProvinceViewController {
    enum Action {
        case provinceData(provice: String)
        case districtAndProvinceData(province: String, district: String)
    }
}

extension ProvinceViewController: DistrictViewDelegate {
    func districtController(_ viewController: DistrictViewController, action: DistrictViewController.Action) {
        switch action {
        case .districtData(district: let districtName):
            guard let provinceName = currentButton.title(for: .normal) else { return }
            delegate?.provinceController(self, action: .districtAndProvinceData(province: provinceName, district: districtName))
        }
    }
}
