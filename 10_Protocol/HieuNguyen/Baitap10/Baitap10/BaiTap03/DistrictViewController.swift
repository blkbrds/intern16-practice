//
//  DistrictViewController.swift
//  Baitap10
//
//  Created by hieungq on 7/12/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class DistrictViewController: UIViewController {

    @IBOutlet weak var verticalStackButton: UIStackView!
    var location: Location?
    weak var delegate: DistrictDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Huyện"
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupButton()
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let locationViewController = vc as? LocationViewController {
                self.delegate = locationViewController
            }
        }
    }

    
    private func setupButton() {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location?.district {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 0.9171207929, green: 0.6194388663, blue: 0.1338604823, alpha: 1)
                }
            }
            button.layer.borderColor = #colorLiteral(red: 0.9171207929, green: 0.6194388663, blue: 0.1338604823, alpha: 1)
        }
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(nextToProvinceViewController))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @IBAction func districtButtonTouchUpInside(_ sender: Any) {
        changeButtonSelected(index: (sender as AnyObject).tag)
    }

    private func changeButtonSelected(index: Int) {
        for button in verticalStackButton.arrangedSubviews {
            if let buttonChoice = location?.district {
                if button.tag == Int(buttonChoice) {
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
            if button.tag == index {
                button.backgroundColor = #colorLiteral(red: 0.9171207929, green: 0.6194388663, blue: 0.1338604823, alpha: 1)
            }
        }
        location?.district = String(index)
    }
    
    @objc func nextToProvinceViewController() {
        delegate?.receiveData(fromVC: self, withData: location!)
        navigationController?.popToRootViewController(animated: true)
    }
}

protocol DistrictDelegate: class {
    func receiveData(fromVC viewController: DistrictViewController,withData location: Location )
}
