//
//  ViewController.swift
//  Bai5.1
//
//  Created by Abcd on 7/4/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SubViewDelegate {
    func didTapOnAvatar(_ myAvatar: MyAvatar) {
        print(myAvatar.userName.text ?? "no name")
    }
    //MARK: - Properties
    var spacingX = 20
    var spacingY = 30
    var names = ["Teo", "TheShy", "Ning", "Rookie", "Sofm", "Slayder", "Palete", "Dnk", "celeb","Teo", "TheShy", "Ning", "Rookie", "Sofm", "Slayder", "Palete", "Dnk", "celeb","Teo", "TheShy", "Ning", "Rookie", "Sofm", "Slayder", "Palete", "Dnk", "celeb","Teo", "TheShy", "Ning"]
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    //MARK: - Function
    private func setupView() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let myScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        myScrollView.contentSize = CGSize(width: screenWidth, height: 2000)
        view.addSubview(myScrollView)
        for i in 1..<names.count {
            let frame = CGRect(x: spacingX, y: spacingY, width: 100, height: 200)
            let avatarView = MyAvatar(frame: frame)
            avatarView.myAvatarDelegate = self
            avatarView.userName.text = names[i]
            spacingX += 110
            if i % 3 == 0 {
                spacingX = 20
                spacingY += 200
            }
            myScrollView.addSubview(avatarView)
        }
    }
}
