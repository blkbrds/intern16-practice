//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0004 on 7/6/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap01: UIViewController {

    // MARK: Propeties
    var scrollView: UIScrollView?

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configAvatar()
    }

    // MARK: Private Methods
    private func configAvatar() {
        let screenSize = UIScreen.main.bounds
        // Lay width cua man hinh
        let widthScreen = screenSize.width
        // Lay height cua man hinh
        let heightScreen = screenSize.height
        // Gan frame cua scrollView
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen))
        // Gan size cho scrollView
        scrollView.contentSize = CGSize(width: widthScreen, height: 1280)
        view.backgroundColor = .white
        // Add scrollView vao view
        view.addSubview(scrollView)
        let myAvatar = MyAvatar(frame: CGRect(x: 0, y: 0, width: 100, height: 250))
        // Add class MyAvatar vao scrollViewa
//        myAvatar.delegate = self
        scrollView.addSubview(myAvatar)
    }
}

// MARK: - MyAvatarDelegate
extension BaiTap01: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int) {
        print("Select user with index \(index).")
    }
}
