//
//  RegionViewController.swift
//  Protocol
//
//  Created by PCI0007 on 7/24/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol RegionViewDelegate: class {
    func regionController(_ viewController: RegionViewController, action: RegionViewController.Action)
}

final class RegionViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var regionButtons: [UIButton]!
    
    // MARK: - Properties
    var currentButton = UIButton()
    weak var delegate: RegionViewDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configBar()
        customButton()
    }
    
    // MARK: - Private Function
    private func configBar() {
        title = "Miền"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(nextPage))
    }
    
    private func customButton() {
        for i in 1..<regionButtons.count {
            regionButtons[i].layer.cornerRadius = 10
        }
    }
    
    // MARK: - Actions
    @objc func nextPage() {
        let next = ProvinceViewController()
        next.delegate = self
        navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func regionTouchUpInside(_ sender: UIButton) {
        if currentButton != sender {
            currentButton.backgroundColor = .systemGray6
            sender.backgroundColor = .systemTeal
            currentButton = sender
        }
    }
}

// MARK: - Extensions
extension RegionViewController {
    enum Action {
        case regionData(region: String)
        case regionAndProviceAndDistrictData(region: String, provice: String, district: String)
    }
}

extension RegionViewController: ProvinceViewDelegate {
    func provinceController(_ viewController: ProvinceViewController, action: ProvinceViewController.Action) {
        switch action {
        case .provinceData: break
        case .districtAndProvinceData(province: let province, district: let district):
            guard let regionName = currentButton.title(for: .normal) else { return }
            delegate?.regionController(self, action: .regionAndProviceAndDistrictData(region: regionName, provice: province, district: district))
        }
    }
}
