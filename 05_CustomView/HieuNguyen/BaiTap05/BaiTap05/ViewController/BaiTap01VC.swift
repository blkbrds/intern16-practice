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
    
    let datas: [Person] = [
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 1"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 2"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 3"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 4"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 5"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 6"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 7"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 8"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 9"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 10"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 11"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 12"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 13"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 14"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 15"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 16"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 17"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 18"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 2"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 3"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 4"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 5"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 6"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 7"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 8"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 9"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 10"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 11"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 12"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 13"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 14"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 15"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 16"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 17"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Name 18")
    ]
    
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
        for i in 0..<datas.count {
            if i % 3 == 0 && i != 0 {
                y += 146
                x = 32
            } else if i != 0 {
                x += 116
            }
            let userView = MyAvatarView(frame: CGRect(x: x, y: y, width: 100, height: 130), name: datas[i].name, image: datas[i].image)
            userView.delegate = self
            scrollView.addSubview(userView)
        }
        scrollView.contentSize = CGSize(width: screenWidth, height: 130 * CGFloat(datas.count) / 3 + 260)
        view.addSubview(scrollView)
    }
}

extension BaiTap01VC: MyAvatarDelegate {
    func view(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action) {
        switch action {
        case .selectAvatar(let name):
            print(name)
        }
    }
}
