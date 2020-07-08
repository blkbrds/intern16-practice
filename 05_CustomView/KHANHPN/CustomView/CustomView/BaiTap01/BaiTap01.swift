//
//  BaiTap01.swift
//  CustomView
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAvavtarView()
    }
    
    // MARK: - Functions
    private func setupAvavtarView() {
        var scrollHeigh: CGFloat = 180
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        var x = 32
        var y = 0
        for i in 0..<100 {
            if i % 3 == 0 && i != 0 {
                y += 160
                x = 32
                scrollHeigh += 160
            } else if i % 3 != 0 {
                x += 130
            }
            let avatarView = AvatarView(frame: CGRect(x: x, y: y, width: 100, height: 130), index: i)
            avatarView.delegate = self
            scrollView.addSubview(avatarView)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: scrollHeigh)
        view.addSubview(scrollView)
    }
}

// MARK: - Extension
extension BaiTap01: AvatarViewDelegate {
    func avatarView(_ avatarView: UIView, getName index: String) {
        print("User \(index)")
    }
}
