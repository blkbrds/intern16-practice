//
//  LocalViewController.swift
//  Protocol
//
//  Created by PCI0001 on 7/25/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit


final class LocalViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet private weak var localButtons: UIButton!
    
    // MARK: - Properties
    var location: Location = Location()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        view.backgroundColor = .white
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(pushToViewTouchUpInside))
        navigationItem.rightBarButtonItem = provinceButton
    }
    
    @objc private func pushToViewTouchUpInside() {
        let nextViewVC = ProvinceViewController()
        nextViewVC.location = location
        navigationController?.pushViewController(nextViewVC, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func getLocalButtonTouchInside(_ sender: UIButton) {
        sender.backgroundColor = .blue
        guard let titleText = sender.titleLabel?.text else { return }
        location.local = titleText
    }
}
