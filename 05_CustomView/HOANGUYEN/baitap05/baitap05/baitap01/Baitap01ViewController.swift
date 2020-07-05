//
//  baitap01ViewController.swift
//  baitap05
//
//  Created by NXH on 7/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap01ViewController: UIViewController {
    
// MARK: - Propeties
    let numberOfItems: Int = 30
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createListAvatar()
    }

// MARK: - Private functions
    func createListAvatar() {
        let widthSizeScrollView: CGFloat = view.frame.width
        var originX: CGFloat = -100
        var originY: CGFloat = 20
        let uiScrollView: UIScrollView = UIScrollView(frame: view.frame)
        uiScrollView.backgroundColor = .green
        //        giới hạn size Scroll View
        uiScrollView.contentSize = CGSize(width: widthSizeScrollView, height: (150 * CGFloat(numberOfItems) / (widthSizeScrollView / 120)) + 100)
        view.addSubview(uiScrollView)
        for i in 0..<30 {
            if originX < view.frame.width - 120 {
                originX += 120
                let test: Avatar = Avatar(frame: CGRect(x: originX, y: originY, width: 100, height: 130))
                test.delegate = self
                uiScrollView.addSubview(test)
                test.createLblName.text = "Name\(i + 1)"
            } else {
                originX = 20
                originY += 150
                let test: Avatar = Avatar(frame: CGRect(x: originX, y: originY, width: 100, height: 130))
                test.delegate = self
                uiScrollView.addSubview(test)
                test.createLblName.text = "Name\(i + 1)"
            }
        }
    }
}

// MARK: - Extension
extension Baitap01ViewController: MyAvatarDelegate {
    func viewPerson(_ person: Avatar, str: String) {
        print(str)
    }
}
