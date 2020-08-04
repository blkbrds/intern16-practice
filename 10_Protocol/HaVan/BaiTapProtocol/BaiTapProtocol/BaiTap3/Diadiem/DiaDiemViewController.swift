//
//  DiaDiemViewController.swift
//  BaiTapProtocol
//
//  Created by NganHa on 7/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit


final class DiaDiemViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnToTinhViewController))
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Objc functions
    @objc private func turnToTinhViewController() {
        let mienVC = MienViewController()
        mienVC.delegate = self
        navigationController?.pushViewController(mienVC, animated: true)
    }
}

// MARK: - MienViewControllerDelegate
extension DiaDiemViewController: MienViewControllerDelegate {
    
    func controller(_ view: MienViewController, needsPerform action: MienViewController.Action) {
        switch action {
        case .saveMien(tenMien: _):
            break
        case .saveMienAndTinhAndHuyen(tenMien: let mien, tenTinh: let tinh, tenHuyen: let huyen):
            tinhLabel.text = tinh
            mienLabel.text = mien
            huyenLabel.text = huyen
        }
    }
}
