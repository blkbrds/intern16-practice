//
//  DetailsViewController.swift
//  baitap11
//
//  Created by NXH on 7/27/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol DetailsViewControllerDataSource: class {
    func getName() -> String
}
final class DetailsViewController: UIViewController {

    private var nameLabel: UILabel = UILabel()

    weak var dataSource: DetailsViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        getNameLabel()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func getNameLabel() {
        guard let data = dataSource?.getName() else { return }
        nameLabel.text = data
    }
}
