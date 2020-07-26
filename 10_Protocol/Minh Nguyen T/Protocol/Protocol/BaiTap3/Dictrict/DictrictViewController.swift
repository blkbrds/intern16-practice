//
//  DictrictViewController.swift
//  Protocol
//
//  Created by MacBook Pro on 7/26/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DictrictViewControllerDelegate: class {
    func getdataDictrict( _ controller: DictrictViewController, needsPerform action: DictrictViewController.Action)
}

final class DictrictViewController: UIViewController {

    // MARK: - Properties
    weak var delegate: DictrictViewControllerDelegate?
    private var titleDictrict: String = ""

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }

    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Huyện"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDonectrovineTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }

    // MARk: - IBActions
    @IBAction func handleDictritButton(_ sender: UIButton) {
        guard let nameDT = sender.titleLabel?.text else { return }
        titleDictrict = nameDT
        sender.backgroundColor = .orange
    }

    // MARK: - Objc functions
    @objc func handleDonectrovineTouchUpInside() {
        delegate?.getdataDictrict(self, needsPerform: .sendDataDictrict(nameDictrict: titleDictrict))
        navigationController?.popToRootViewController(animated: true)
    }
}

extension DictrictViewController {
    enum Action {
        case sendDataDictrict(nameDictrict: String)
    }
}
