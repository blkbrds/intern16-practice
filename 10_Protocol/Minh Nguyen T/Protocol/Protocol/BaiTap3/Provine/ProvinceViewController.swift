//
//  ProvineViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

// MARK: - ProvineViewControllerDelegate
protocol ProvinceViewControllerDelegate: class {
    func getDataProvine(_ controller: ProvinceViewController, needsPreform action: ProvinceViewController.Action)
}

final class ProvinceViewController: UIViewController {

    // MARK: - Properties
    weak var delegate: ProvinceViewControllerDelegate?
    private var titleProvince: String = ""

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Tinh"
        let dictrictButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(handleToDictrictrovineTouchUpInside))
        navigationItem.rightBarButtonItem = dictrictButton
    }

    // MARK: - IBActions
    @IBAction private func handleProvineButtonTouchUpInside(_ sender: UIButton) {
        guard let nameProvine = sender.titleLabel?.text else { return }
        titleProvince = nameProvine
        sender.backgroundColor = .green
    }

    // MARK: - Objc functions
    @objc private func handleToDictrictrovineTouchUpInside() {
        let provineVC = DictrictViewController()
        provineVC.delegate = self
        navigationController?.pushViewController(provineVC, animated: true)
    }
}

extension ProvinceViewController {
    enum Action {
        case sendDataProvine(nameProvine: String)
        case sendDictrictAndProvine(nameDictrict: String, nameProvine: String)
    }
}

extension ProvinceViewController: DictrictViewControllerDelegate {
    func getdataDictrict(_ controller: DictrictViewController, needsPerform action: DictrictViewController.Action) {
        switch action {
        case .sendDataDictrict(nameDictrict: let nameDictict):
            delegate?.getDataProvine(self, needsPreform: .sendDictrictAndProvine(nameDictrict: nameDictict, nameProvine: titleProvince))
        }
    }
}
