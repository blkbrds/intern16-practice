//
//  ProvinceViewController.swift
//  baitap10
//
//  Created by NXH on 7/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class ProvinceViewController: UIViewController {
    
    private var provincesButton: [UIButton] = []
    private var provincesList: Domain!
    private var previousButton: UIButton = UIButton()
    private var selectedProvince: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNavigationBar()
        loadData()
        loadUI()
    }
    
    // MARK: - Private func
    private func configNavigationBar() {
        title = "Tỉnh"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(tapHuyenButton))
    }
    
    private func configButton() -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(tapProvincesButton(_:)), for: .touchUpInside)
        return button
    }
    
    private func checkSlectedButton() {
        previousButton.backgroundColor = .white
        previousButton.setTitleColor(.red, for: .normal)
    }
    
    private func loadData() {
        
        guard let data = UserDefaults.standard.value(forKey: "Domain") as? String else { return }
        provincesList = Domain(domain: (data))
    }
    
    private func loadUI() {
        var space: CGFloat = 30
        for index in 0..<provincesList.province.count {
            provincesButton.append(configButton())
            view.addSubview(provincesButton[index])
            provincesButton[index].setTitle(provincesList.province[index].province, for: .normal)
            
            if let data =  UserDefaults.standard.value(forKey: "Data") as? [String] {
                if data[1] == provincesButton[index].currentTitle {
                    provincesButton[index].backgroundColor = .red
                    provincesButton[index].setTitleColor(.white, for: .normal)
                    previousButton = provincesButton[index]
                }
            }
            provincesButton[index].centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            provincesButton[index].centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: space).isActive = true
            provincesButton[index].widthAnchor.constraint(equalToConstant: 250).isActive = true
            space += 50
        }
    }
    // MARK: - Objc Func
    @objc private func tapHuyenButton() {

        if let _ = previousButton.currentTitle {
            let view = DistrictViewController()
            navigationController?.pushViewController(view, animated: true)
        }
    }
    
    @objc private func tapProvincesButton(_ sender: UIButton) {
        checkSlectedButton()
        sender.backgroundColor = .red
        sender.setTitleColor(.white, for: .normal)
        previousButton = sender
        guard let title = sender.currentTitle else {
            return
        }
        selectedProvince = title
        UserDefaults.standard.setValue(selectedProvince, forKey: "Province")
    }
}

