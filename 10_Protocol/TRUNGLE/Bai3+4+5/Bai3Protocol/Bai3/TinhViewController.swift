//
//  TinhViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 8/27/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class TinhViewController: BaseViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var tinhButton: [UIButton]!
    
    //MARK: - Properties
    var diaDiem: DiaDiem = DiaDiem()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupNavigationBar() {
        title = "Province"
        let rightButton = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton

        let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(leftButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Function
    @objc private func rightButtonTouchUpInside() {
        let vc = HuyenViewController()
        vc.diaDiem = diaDiem
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func leftButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tinhPressed(_ sender: UIButton) {
        tinhButton.forEach({ $0.backgroundColor = .gray })
        sender.backgroundColor = .green
        diaDiem.tinh = sender.titleLabel?.text ?? ""
    }
    
}
