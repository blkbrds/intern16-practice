//
//  DomainViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

// MARK: - DomainViewControllerDelegate
protocol DomainViewControllerDelegate: class {
    func getDataDomain(_ controller: DomainViewController, needsPerform action: DomainViewController.Action)
}

final class DomainViewController: UIViewController {

    // MARK: - Properties
    weak var delegate: DomainViewControllerDelegate?
    var titleDomain: String = ""

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Miền"
        let provineButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(handleToProvineTouchUpInside))
        navigationItem.rightBarButtonItem = provineButton
    }

    // MARK: - IBActions
    @IBAction private func handleDomainButtonTouchUpInside(_ sender: UIButton) {
        guard let nameDomain = sender.titleLabel?.text else { return }
        titleDomain = nameDomain
        sender.backgroundColor = .blue
    }

    // MARK: - Objc functions
    @objc private func handleToProvineTouchUpInside() {
        let provineVC = ProvineViewController()
        provineVC.delegate = self
        navigationController?.pushViewController(provineVC, animated: true)
    }
}

extension DomainViewController {
    enum Action {
        case sendDataDomain(nameDomain: String)
        case sendDataDomainProvineDictrict(nameDictrict: String, nameProvine: String, nameDomain: String)
    }
}

extension DomainViewController: ProvineViewControllerDelegate {
    func getDataProvine(_ controller: ProvineViewController, needsPreform action: ProvineViewController.Action) {
        switch action {
            
        case .sendDataProvine(nameProvine: _):
            break
        case .sendDictrictAndProvine(nameDictrict: let nameDictrict, nameProvine: let nameProvine):
            delegate?.getDataDomain(self, needsPerform: .sendDataDomainProvineDictrict(nameDictrict: nameDictrict, nameProvine: nameProvine, nameDomain: titleDomain))
        }
    }
}
