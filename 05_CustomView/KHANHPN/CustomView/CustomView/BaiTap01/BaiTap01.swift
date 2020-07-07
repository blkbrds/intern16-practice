//
//  BaiTap01.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

class BaiTap01: UIViewController {


    // MARK: - Data
    struct User {
        var name: String
        var avatar: UIImageView
    }

    // MARK: - Properties
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

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
    }

    // MARK: - Private Functions
//    private func setupView() {
//      
//        UIScrollView()
//
//        for i in 0..<data.count {
//            let User = AvatarView(frame: CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView))
//
//
//            scrollView.addSubview(User)
//            // Tinh frame
//            if xView + widthUserView > widthScreen - xView {
//                yView += heightUserView + space
//                xView = space
//            } else {
//                xView += widthUserView + space
//            }
//        }
//    }
//}
//
//extension BaiTap01: AvatarViewDelegate {
//    func userView(_ userView: AvatarView, didSelect index: Int) {
//        print("kimochiii")
//    }
//}
}
