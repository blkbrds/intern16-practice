//
//  BaiTap01.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {
    struct Profile {
        var userNames: String
        var userImages: UIImage
    }
    let data: [Profile] = [
        Profile(userNames: "A", userImages: UIImage(named: "img-avatar")!),
    ]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvavtarView()
    }
    
    // MARK: - Functions
    private func setupAvavtarView() {
        var scrollHeight: CGFloat = 180
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        var x = 32
        var y = 0
        for i in 0..<data.count {
            if i % 3 == 0 && i != 0 {
                y += 160
                x = 32
                scrollHeight += 160
            } else if i % 3 != 0 {
                x += 130
            }
//            let avatarView = AvatarView(frame: CGRect(x: x, y: y, width: 100, height: 130), name: userNames[i], image: userImages[i])
//            avatarView.delegate = self
//            scrollView.addSubview(avatarView)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: scrollHeight)
        view.addSubview(scrollView)
    }
}

// MARK: - Extension
extension BaiTap01: AvatarViewDelegate {
    func avatarView(_ avatarView: UIView, getName name: String) {
        print("User \(name)")
    }
}
