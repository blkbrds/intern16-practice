//
//  DomainViewController.swift
//  baitap10
//
//  Created by NXH on 7/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class DomainViewController: UIViewController {
    
    // MARK: - Properties
    private let dataDomain: Location = Location()
    private var provincesButton: [UIButton] = []
    private var previousButton: UIButton = UIButton()
    private var selectedDomain: String = ""
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNavigationBar()
        loadUI()
    }
    
    // MARK: - Private func
    private func configNavigationBar() {
        title = "Miền"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(tapTinhButton))
    }
    
    private func configButton() -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(tapProvincesButton(_:)), for: .touchUpInside)
        return button
    }
    
    private func checkSlectedButton() {
        previousButton.backgroundColor = .white
        previousButton.setTitleColor(.blue, for: .normal)
    }
    
    private func loadUI() {
        var space: CGFloat = 30
        for index in 0..<dataDomain.location.count {
            provincesButton.append(configButton())
            view.addSubview(provincesButton[index])
            provincesButton[index].setTitle(dataDomain.location[index].domain, for: .normal)
            if let data =  UserDefaults.standard.value(forKey: "Data") as? [String] {
                if data[0] == provincesButton[index].currentTitle {
                    provincesButton[index].backgroundColor = .blue
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
    @objc private func tapProvincesButton(_ sender: UIButton) {
        checkSlectedButton()
        sender.backgroundColor = .blue
        sender.setTitleColor(.white, for: .normal)
        previousButton = sender
        guard let title = sender.currentTitle else {
            return
        }
        selectedDomain = title
        UserDefaults.standard.setValue(selectedDomain, forKey: "Domain")
    }
    
    @objc private func tapTinhButton() {
        if let _ = previousButton.currentTitle {
            let view = ProvinceViewController()
            navigationController?.pushViewController(view, animated: true)
        }
    }
}
