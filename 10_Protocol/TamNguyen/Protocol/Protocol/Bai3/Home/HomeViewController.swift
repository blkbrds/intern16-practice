//
//  HomeViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

//
//  HomeViewController.swift
//  BaitapProtocol
//
//  Created by PCI0001 on 7/24/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

protocol HomeViewControllerDataSouce: class {
    func getLocal() -> String?
    func getProvince() -> String?
    func getDistrict() -> String?
}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    weak var dataSource: HomeViewControllerDataSouce?
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
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(pushToViewTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
     func unwrapOptional() {
        guard let localText = dataSource?.getLocal(), let provinceText = dataSource?.getProvince(), let districtText = dataSource?.getDistrict() else { return }
        localLabel.text = localText
        provinceLabel.text = provinceText
        distrcitLabel.text = districtText
    }
    
    @objc private func pushToViewTouchUpInside() {
        let nextViewVC = LocalViewController()
        navigationController?.pushViewController(nextViewVC, animated: true)
    }
}

