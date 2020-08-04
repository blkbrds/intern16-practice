//
//  LocationViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class LocationViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var provineLabel: UILabel!
    @IBOutlet private weak var dictrictLabel: UILabel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        cofigLabel()
    }

    // MARK: - Private functions
    private func cofigLabel() {
        domainLabel.textColor = .blue
        provineLabel.textColor = .green
        dictrictLabel.textColor = .orange
    }

    private func configNavigationBar() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleToDomainTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    // MARK: - Objc functions
    @objc private func handleToDomainTouchUpInside() {
        let domainVC = DomainViewController()
        domainVC.delegate = self
        navigationController?.pushViewController(domainVC, animated: true)
    }
}

extension LocationViewController: DomainViewControllerDelegate {
    func getDataDomain(_ controller: DomainViewController, needsPerform action: DomainViewController.Action) {
        switch action {
        case .sendDataDomain(nameDomain: _):
            break
        case .sendDataDomainProvineDictrict(nameDictrict: let nameDictrict, nameProvine: let nameProvine, nameDomain: let nameDomain):
            domainLabel.text = nameDomain
            provineLabel.text = nameProvine
            dictrictLabel.text = nameDictrict
        }
    }
}
