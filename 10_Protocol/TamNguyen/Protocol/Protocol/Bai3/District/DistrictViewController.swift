//
//  DistrictViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class DistrictViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var districtButton: UIButton!
    
    // MARK: - Properties
    var location: Location = Location()
    private var local: String?
    private var province: String?
    private var district: String?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Huyện"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pushToRootButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func pushToRootButtonTouchUpInside() {
        district = location.district
        province = location.province
        local = location.local
        
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers where vc is HomeViewController {
            guard let locationVC = vc as? HomeViewController else {return}
            locationVC.dataSource = self
            locationVC.updateView()
            navi.popToViewController(locationVC, animated: true)
        }
    }
    
    // MARK: - IBActions
    @IBAction private func getDistrictButtonTouchUpInside(_ sender: UIButton) {
        sender.backgroundColor = .orange
        guard let titleText = sender.titleLabel?.text else { return }
        location.district = titleText
    }
}

// MARK: - Extension HomeViewControllerDataSource
extension DistrictViewController: HomeViewControllerDataSource {
    
    func getDistrict() -> String? {
        guard let district = district else { return "" }
        return district
    }
    
    func getProvince() -> String? {
        guard let province = province else { return "" }
        return province
    }
    
    func getLocal() -> String? {
        guard let local = local else { return "" }
        return local
    }
}
