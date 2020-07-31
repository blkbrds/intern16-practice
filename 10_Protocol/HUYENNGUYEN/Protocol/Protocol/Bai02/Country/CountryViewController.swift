//
//  CountryViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol CountryViewControllerDelegate: class {
    func controller(_ controller: CountryViewController, needsPerform action: Action)
}

protocol CountryViewControllerDataSource: class {
    func getCountry() -> [Mien]
}

final class CountryViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    private var countryButtons: [UIButton] = []
    private var miens: [Mien] = []
    weak var delegate: CountryViewControllerDelegate?
    weak var dataSource: CountryViewControllerDataSource?
    private var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    private func configUI() {
        title = "Miền"
        let provinceButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(goToProvinceVC))
        navigationItem.rightBarButtonItem = provinceButton
        
        if let dataSource = dataSource {
            miens = dataSource.getCountry()
        }
        
        for (index, item) in miens.enumerated() {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.setTitle(item.name, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(countryTouchUpInside), for: .touchUpInside)
            countryButtons.append(button)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func goToProvinceVC(_ sender: UIButton) {
        let provinceView = ProvinceViewController()
        provinceView.delegate = self
        provinceView.dataSource = self
        navigationController?.pushViewController(provinceView, animated: true)
    }
    
    @objc private func countryTouchUpInside(_ sender: UIButton) {
        countryButtons.forEach { button in
            button.backgroundColor = .gray
        }
        sender.backgroundColor = .red
        delegate?.controller(self, needsPerform: .sendCountry(miens[sender.tag].name))
        selectedIndex = sender.tag
    }
}

extension CountryViewController: ProvinceViewControllerDelegate {
    func controller(_ controller: ProvinceViewController, needsPerform action: Action) {
        switch action {
        case .sendProvince(let province):
            delegate?.controller(self, needsPerform: .sendProvince(province))
        case .sendDictrict(let district):
            delegate?.controller(self, needsPerform: .sendDictrict(district))
        default:
            break
        }
    }
    
}

extension CountryViewController: ProvinceViewControllerDataSource {
    func getProvince() -> [Tinh] {
        return miens[selectedIndex].tinhs
    }
}
