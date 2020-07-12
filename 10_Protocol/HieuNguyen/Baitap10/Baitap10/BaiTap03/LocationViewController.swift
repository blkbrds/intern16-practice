//
//  LocationViewController.swift
//  Baitap10
//
//  Created by hieungq on 7/11/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    // region    province    districts
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    var location: Location = Location(region: "5", province: "10", district: "1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        let vc = DistrictViewController()
        vc.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let righButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(moveToRegion))
        navigationItem.rightBarButtonItem = righButton
        setupAllLabel()
    }

    @objc func moveToRegion() {
        let regionViewController = RegionViewController()
        regionViewController.location = location
        navigationController?.pushViewController(regionViewController, animated: true)
    }
  
    private func setupAllLabel() {
        regionLabel.text = "Miền \(location.region ?? "")"
        provinceLabel.text = "Tỉnh \(location.province ?? "")"
        districtLabel.text = "Huyện \(location.district ?? "")"
    }
}
extension LocationViewController: DistrictDelegate {
    func receiveData(fromVC viewController: DistrictViewController, withData location: Location) {
        self.location = location
    }
}
