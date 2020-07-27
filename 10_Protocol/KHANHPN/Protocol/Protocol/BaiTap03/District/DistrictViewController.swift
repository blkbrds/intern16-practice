//
//  DistrictViewController.swift
//  Protocol
//
//  Created by PCI0007 on 7/24/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol DistrictViewDelegate: class {
    func districtController(_ viewController: DistrictViewController, action: DistrictViewController.Action)
}

final class DistrictViewController: UIViewController {

    // MARK: - IBOutlet:
    @IBOutlet var districtButtons: [UIButton]!
    
    // MARK: - Properties:
    var currentButton = UIButton()
    weak var delegate: DistrictViewDelegate?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configBar()
        customButton()
    }
    
    // MARK: - Functions
    private func customButton() {
        for i in 1..<districtButtons.count {
            districtButtons[i].layer.cornerRadius = 10
        }
    }
    
    private func configBar() {
        title = "Huyện"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(rootPage))
    }
    
    // MARK: - Actions
    @IBAction func districtTouchUpInside(_ sender: UIButton) {
        if currentButton != sender {
            currentButton.backgroundColor = .systemGray6
            sender.backgroundColor = .orange
            currentButton = sender
        }
    }
    
    @objc func rootPage() {
        guard let dictrictName = currentButton.title(for: .normal) else { return }
        delegate?.districtController(self, action: .districtData(district: dictrictName))
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Extensions
extension DistrictViewController {
    enum Action {
        case districtData(district: String)
    }
}
