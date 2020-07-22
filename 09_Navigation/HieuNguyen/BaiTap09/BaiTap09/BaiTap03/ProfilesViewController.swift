//
//  HomeViewController.swift
//  BaiTap09
//
//  Created by PCI0020 on 7/9/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class ProfilesViewController: UIViewController {

    var Datas: [Person] = [
        Person(name: "Tien Le P."),
        Person(name: "Dai Ho V."),
        Person(name: "Trin Nguyen X."),
        Person(name: "Khanh Phan N."),
        Person(name: "Huyen Nguyen"),
        Person(name: "Hoa Nguyen"),
        Person(name: "Minh Nguyen"),
        Person(name: "Hieu Nguyen"),
        Person(name: "Tam Nguyen"),
        Person(name: "Trung Le"),
        Person(name: "Anh Pham"),
        Person(name: "Thinh Nguyen"),
        Person(name: "Lam Le"),
        Person(name: "Quan Bui"),
        Person(name: "Hien Mai"),
        Person(name: "Thang Le"),
        Person(name: "Tien Tran"),
        Person(name: "Hanh Nguyen"),
        Person(name: "An Nguyen"),
        Person(name: "Phuoc Nguyen"),
        Person(name: "Hung Pham"),
        Person(name: "Thanh Nguyen"),
        Person(name: "Toan Nguyen"),
        Person(name: "Quoc Doan"),
        Person(name: "Que Dinh"),
        Person(name: "Tan Huynh"),
        Person(name: "Nhi Kieu"),
        Person(name: "Bien Le"),
        Person(name: "Nhi Kieu"),
        Person(name: "Bien Le")
    ]
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupImageView()
    }
    
    private func setupImageView() {
        var x: Int = 32
        var y: Int = 32
        for i in 0..<30 {
            if i % 3 == 0 && i != 0 {
                y += 146
                x = 32
            } else if i != 0 {
                x += 116
            }
            let userView = MyAvatar(frame: CGRect(x: x, y: y, width: 100, height: 130), profileName: Datas[i].name)
            userView.delegate = self
            scrollView.addSubview(userView)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 130 * 12)
        view.addSubview(scrollView)
    }
}

extension ProfilesViewController: MyAvatarDelegate {
    func pushViewController(_ personView: MyAvatar, _ profile: String) {
        let profileViewController = DetailProfileViewController()
        profileViewController.userName = profile
        navigationController?.pushViewController(profileViewController, animated: true)        
    }
}
