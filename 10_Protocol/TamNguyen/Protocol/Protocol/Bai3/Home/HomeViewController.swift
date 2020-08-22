//
//  HomeViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol HomeViewControllerDataSource: class {
    func getLocal() -> String?
    func getProvince() -> String?
    func getDistrict() -> String?
}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    weak var dataSource: HomeViewControllerDataSource?
    
    // MARK: - IBOulets
    @IBOutlet private weak var localLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var distrcitLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(pushToViewButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func pushToViewButtonTouchUpInside() {
        let nextViewVC = LocalViewController()
        navigationController?.pushViewController(nextViewVC, animated: true)
    }
    
    // MARK: - Public methods
    func updateView() {
        if let localText = dataSource?.getLocal(), let provinceText = dataSource?.getProvince(), let districtText = dataSource?.getDistrict() {
            localLabel.text = localText
            provinceLabel.text = provinceText
            distrcitLabel.text = districtText
        }
    }
}
