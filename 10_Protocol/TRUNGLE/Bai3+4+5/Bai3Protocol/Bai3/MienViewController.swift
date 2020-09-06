//
//  MienViewController.swift
//  Bai3Protocol
//
//  Created by Abcd on 9/3/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
struct DiaDiem {
    var mien: String = ""
    var tinh: String = ""
    var huyen: String = ""
}

final class MienViewController: BaseViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var localButton: [UIButton]!
    
    //MARK: - Properties
    var diaDiem: DiaDiem = DiaDiem()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Local"
        let rightButton = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(rightBarButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton
        let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(leftBarButtonTouchUpInside))
    navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Function
    @IBAction func getMienPressed(_ sender: UIButton) {
        localButton.forEach({ $0.backgroundColor = .gray })
        sender.backgroundColor = .blue
        guard let titleText = sender.titleLabel?.text else { return }
        diaDiem.mien = titleText
    }
    
    @objc func rightBarButtonTouchUpInside() {
        let tinhVC = TinhViewController()
        tinhVC.diaDiem = diaDiem
        navigationController?.pushViewController(tinhVC, animated: true)
    }
    
    @objc func leftBarButtonTouchUpInside() {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers where vc is DiaDiemViewController {
            guard let diaDiemVC = vc as? DiaDiemViewController else { return }
            navi.popToViewController(diaDiemVC, animated: true)
        }
    }
}
