//
//  ProvinceViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol ProvinceViewControllerDelegate: class {
    func controller(_ controller: ProvinceViewController, needsPerform action: Action)
}
protocol  ProvinceViewControllerDataSource: class {
    func getProvince() -> [Tinh]
}

class ProvinceViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    private var provinceButtons: [UIButton] = []
    private var tinhs: [Tinh] = []
    weak var delegate: ProvinceViewControllerDelegate?
    weak var dataSource: ProvinceViewControllerDataSource?
    private var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Tỉnh"
        let districtButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(goToDistrict))
        navigationItem.rightBarButtonItem = districtButton
        
        if let dataSource = dataSource {
            tinhs = dataSource.getProvince()
        }

        for (index, item) in tinhs.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(provinceTouchUpInside), for: .touchUpInside)
            provinceButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func goToDistrict(_ sender: UIButton) {
        let districtView = DistrictViewController()
        districtView.delegate = self
        districtView.dataSoure = self
        navigationController?.pushViewController(districtView, animated: true)
    }
    
    @objc private func provinceTouchUpInside(_ sender: UIButton) {
        provinceButtons.forEach { button in
            button.backgroundColor = .gray
        }
        sender.backgroundColor = .blue
        delegate?.controller(self, needsPerform: .sendProvince(tinhs[sender.tag].name))
    }
}

extension ProvinceViewController: DistrictViewControllerDelegate {
    func controller(_ controller: DistrictViewController, needsPerform action: Action) {
        switch action {
        case .sendDictrict(let district):
            delegate?.controller(self, needsPerform: .sendDictrict(district))
        default:
            break
        }
    }
}

extension ProvinceViewController: DistrictViewControllerDataSource {
    func getDistrict() -> [Huyen] {
        return tinhs[selectedIndex].huyens
    }
}
