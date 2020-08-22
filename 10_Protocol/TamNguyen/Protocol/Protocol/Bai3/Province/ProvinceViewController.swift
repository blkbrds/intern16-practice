//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class ProvinceViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var provinceButton: UIButton!
    
    // MARK: - Properties
    var location: Location = Location()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Tỉnh"
        let districtButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(pushToViewButtonTouchUpInside))
        navigationItem.rightBarButtonItem = districtButton
    }
    
    @objc private func pushToViewButtonTouchUpInside() {
        let nextViewVC = DistrictViewController()
        nextViewVC.location = location
        navigationController?.pushViewController(nextViewVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func getProvinceButtonTouchUpInside(_ sender: UIButton) {
        sender.backgroundColor = .green
        guard let titleText = sender.titleLabel?.text else { return }
        location.province = titleText
    }
}
