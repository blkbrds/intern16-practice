//
//  LocationViewController.swift
//  baitap10
//
//  Created by NXH on 7/20/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class LocationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let data =  UserDefaults.standard.value(forKey: "Data") as? [String] else { return }
        domainLabel.text = data[0]
        provinceLabel.text = data[1]
        districtLabel.text = data[2]
    }
    
    // MARK: - Private Functionn
    private func configNavigationBar() {
        title = "Địa Điểm"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tapEditButton))
    }
    
    // MARK: - Objc Func
    @objc private func tapEditButton() {
        let view = DomainViewController()
        navigationController?.pushViewController(view, animated: true)
    }
}
