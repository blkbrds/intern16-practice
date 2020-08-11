//
//  DistrictViewController.swift
//  baitap10
//
//  Created by NXH on 7/21/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class DistrictViewController: UIViewController {
    
    // MARK: - Properties
    private var provincesButton: [UIButton] = []
    private var districtList: Province!
    private var previousButton: UIButton = UIButton()
    private var selectedDistrictce: String = ""
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNavigationBar()
        loadData()
        loadUI()
    }
    
    // MARK: - Private func
    private func configNavigationBar() {
        title = "Huyện"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneButton))
    }
    
    private func configButton() -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitleColor(.green, for: .normal)
        button.layer.borderColor = UIColor.green.cgColor
        button.addTarget(self, action: #selector(tapDistrictButton(_:)), for: .touchUpInside)
        return button
    }
    
    private func checkSlectedButton() {
        previousButton.backgroundColor = .white
        previousButton.setTitleColor(.green, for: .normal)
    }
    
    private func loadData() {
        guard let data = UserDefaults.standard.value(forKey: "Province") as? String else { return }
        districtList = Province(province: data)
    }
    
    private func loadUI() {
        var space: CGFloat = 30
        for index in 0..<districtList.districts.count {
            provincesButton.append(configButton())
            view.addSubview(provincesButton[index])
            provincesButton[index].setTitle(districtList.districts[index].district, for: .normal)
            
            if let data =  UserDefaults.standard.value(forKey: "Data") as? [String] {
                if data[2] == provincesButton[index].currentTitle {
                    provincesButton[index].backgroundColor = .green
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
    @objc private func tapDoneButton() {
        if let _ = previousButton.currentTitle {
            var dataLocation: [String] = []
            guard let domain = UserDefaults.standard.value(forKey: "Domain") as? String, let province = UserDefaults.standard.value(forKey: "Province") as? String, let district = UserDefaults.standard.value(forKey: "District") as? String else { return }
            dataLocation.append(domain)
            dataLocation.append(province)
            dataLocation.append(district)
            UserDefaults.standard.set(dataLocation, forKey: "Data")
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc private func tapDistrictButton(_ sender: UIButton) {
        checkSlectedButton()
        sender.backgroundColor = .green
        sender.setTitleColor(.white, for: .normal)
        previousButton = sender
        guard let title = sender.currentTitle else {
            return
        }
        selectedDistrictce = title
        UserDefaults.standard.setValue(selectedDistrictce, forKey: "District")
    }
}
