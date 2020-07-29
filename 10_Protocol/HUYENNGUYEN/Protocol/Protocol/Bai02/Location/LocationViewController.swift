//
//  LocationViewController.swift
//  Protocol
//
//  Created by bu on 7/28/20.
//  Copyright © 2020 bu. All rights reserved.
//

import UIKit

protocol LocationViewControllerDataSource: class {
    func getCountry() -> String
    func getProvince() -> String
    func getDistrict() -> String
}
class LocationViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    weak var dataSource: LocationViewControllerDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func configUI(){
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func editAction(){
        let countryView = CountryViewController()
        countryView.miens = DataManagement.miens
        navigationController?.pushViewController(countryView, animated: true)
        
    }
    
    private func setupUI() {
        if let dataSource = dataSource {
            print(dataSource.getCountry())
            countryLabel.text = dataSource.getCountry()
            provinceLabel.text = dataSource.getProvince()
            districtLabel.text = dataSource.getDistrict()
        }
    }
}
