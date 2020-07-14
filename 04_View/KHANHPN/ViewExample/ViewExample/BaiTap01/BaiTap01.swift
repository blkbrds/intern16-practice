//
//  BaiTap01.swift
//  ViewExample
//
//  Created by PCI0007 on 6/29/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private Functions
    private func configView() {
        // Add user avatar
        let frame = CGRect(x: 30, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "img-avatar"))
        userAvatar.frame = frame
        view.addSubview(userAvatar)

        // Add user name
        let userName = UILabel(frame: CGRect(x: 30, y: 200, width: 100, height: 30))
        userName.text = "Chipuscu"
        userName.backgroundColor = .lightGray
        userName.textColor = .white
        userName.textAlignment = .center
        view.addSubview(userName)

        // Add button
        let button = UIButton(frame: CGRect(x: 30, y: 200, width: 100, height: 30))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(showAlertTouchUpInside), for: .touchUpInside)
        view.addSubview(button)
    }

    // MARK: - Action
    @IBAction private func showAlertTouchUpInside() {
        let alert = UIAlertController(title: "User detail",
            message: "Phan Ngoc Khanh",
            preferredStyle: .alert)

        let action = UIAlertAction(title: "Okay", style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
