//
//  BaiTap01VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 6/30/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap01VC: UIViewController {

    struct Person {
        var image: UIImage
        var name: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        
    }

    private func setupImageView() {
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))

        var x: Int = 32
        var y: Int = 32
        for i in 0..<30{
            if i % 3 == 0 && i != 0 {
                y += 146
                x = 32
            } else if i != 0 {
                x += 116
            }
            let userView = MyAvatar(frame: CGRect(x: x, y: y, width: 100, height: 130), index: i)
            userView.delegate = self
            scrollView.addSubview(userView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 130 * 12)
        view.addSubview(scrollView)
    }
}

extension BaiTap01VC: MyAvatarDelegate {
    func setData(_ personView: MyAvatar, _ index: String) {
        print(index)
    }
}
