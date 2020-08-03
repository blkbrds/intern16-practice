//
//  DistrictViewController.swift
//  Protocol
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol DistrictViewControllerDelegate: class {
    func controller(_ controller: DistrictViewController, needsPerform action: Action)
}

protocol DistrictViewControllerDataSource: class {
    func getDistrict() -> [District]
}

class DistrictViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var stackView: UIStackView!

    // MARK: - Properties
    private var districtButtons: [UIButton] = []
    private var districts: [District] = []
    weak var delegate: DistrictViewControllerDelegate?
    weak var dataSoure: DistrictViewControllerDataSource?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "Huyện"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goToLocation))
        navigationItem.rightBarButtonItem = doneButton
        
        if let dataSource = dataSoure {
            districts = dataSource.getDistrict()
        }
    
        for (index, item) in districts.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(districtTouchUpInside), for: .touchUpInside)
            districtButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Objc
    @objc private func goToLocation(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func districtTouchUpInside(_ sender: UIButton) {
        districtButtons.forEach { button in
            button.backgroundColor = .gray
        }
        sender.backgroundColor = .orange
        delegate?.controller(self, needsPerform: .sendDictrict(districts[sender.tag].name))
    }
}
