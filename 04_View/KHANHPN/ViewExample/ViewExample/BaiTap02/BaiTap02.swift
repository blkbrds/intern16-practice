//
//  BaiTap02.swift
//  ViewExample
//
//  Created by PCI0007 on 6/30/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap02: UIViewController {

    // MARK: - Data
    struct User {
        var name: String
        var avatar: UIImageView
    }

    private let data: [User] = [
        User(name: "2", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "3", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "4", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "5", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "6", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "7", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "8", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "9", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "10", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "J", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "Q", avatar: UIImageView(image: UIImage(named: "img-avatar.png"))),
        User(name: "K", avatar: UIImageView(image: UIImage(named: "img-avatar.png")))
    ]

    // MARK: - Lide cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Functions
    func userView(frame: CGRect, person: User) -> UIView {
        let frameView = UIView()
        frameView.frame = frame

        // Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = person.avatar
        userAvatar.frame = frame
        frameView.addSubview(userAvatar)

        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = "\(person.name)"
        userName.backgroundColor = .lightGray
        userName.textColor = .white
        userName.textAlignment = .center
        frameView.addSubview(userName)
        return frameView
    }

    func setup() {
        var alignLeading = 32
        var alignTop = 64
        for i in 0..<data.count {
            if i % 3 == 0 && i != 0 {
                alignTop += 160
                alignLeading = 32
            } else if i != 0 {
                alignLeading += 130
            }
            view.addSubview(userView(frame: CGRect(x: alignLeading, y: alignTop, width: 100, height: 130), person: data[i]))
        }
    }
}
