//
//  HuyenViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 8/27/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class HuyenViewController: BaseViewController {
    
    //MARK: - Properties
    var diaDiem: DiaDiem = DiaDiem()
    var huyen: String?
    var tinh: String?
    var mien: String?
    
    //MARK: - IBOutlet
    @IBOutlet var huyenButton: [UIButton]!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Function
    override func setupNavigationBar() {
        title = "District"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToHomeViewControllerTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton

        let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToProvinceViewController))
        navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backToProvinceViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func backToHomeViewControllerTouchUpInside() {
        huyen = diaDiem.huyen
        tinh = diaDiem.tinh
        mien = diaDiem.mien

        guard let navi = navigationController else { return }
        for vc in navi.viewControllers where vc is DiaDiemViewController {
            guard let diaDiemVC = vc as? DiaDiemViewController else {return}
            diaDiemVC.delegate = self
            diaDiemVC.setUpUI()
            navi.popToViewController(diaDiemVC, animated: true)
        }
    }
    @IBAction func huyenButtonPressed(_ sender: UIButton) {
        huyenButton.forEach({ $0.backgroundColor = .gray })
              sender.backgroundColor = .orange
              diaDiem.huyen = sender.titleLabel?.text ?? ""
    }
    
}
    //MARK: - Extension
extension HuyenViewController: DiaDiemViewControllerDelegate {
    func getMien() -> String {
        guard let mien = mien else { return "" }
        return mien
    }
    
    func getTinh() -> String {
        guard let tinh = tinh else { return "" }
        return tinh
    }
    
    func getHuyen() -> String {
        guard let huyen = huyen else { return "" }
        return huyen
    }
}
