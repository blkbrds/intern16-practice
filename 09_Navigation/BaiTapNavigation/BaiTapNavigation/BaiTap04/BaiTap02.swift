//
//  BaiTap02.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/23/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "News feed"
}

final class BaiTap02: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        searchButton()
        rightButton()
        configUI()
    }

    // MARK: - Private functions
    private func searchButton() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(clickAction))
        navigationItem.leftBarButtonItem = searchButton
    }

    private func rightButton() {
        let userButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        userButton.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        userButton.setImage(UIImage(named: "img_avatar_01"), for: .normal)

        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightCustomView.layer.cornerRadius = 20
        rightCustomView.layer.masksToBounds = true
        rightCustomView.addSubview(userButton)

        let rightButton = UIBarButtonItem(customView: rightCustomView)
        navigationItem.rightBarButtonItem = rightButton
    }

    private func configUI() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    // MARK: - Objc functions
    @objc private func clickAction() {
        print("tap")
    }
}
