//
//  BaiTap04VC.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/10/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap04VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Button Test"
        setupView()
    }
    
    private func setupView() {
        let image:UIImage = UIImage(systemName: "questionmark.square")!
        let userButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goToBaitap5))
        navigationItem.rightBarButtonItem = userButton
    }
    
    @objc func goToBaitap5() {
        let bt5 = BaiTap05VC()
        navigationController?.pushViewController(bt5, animated: true)
    }

}
