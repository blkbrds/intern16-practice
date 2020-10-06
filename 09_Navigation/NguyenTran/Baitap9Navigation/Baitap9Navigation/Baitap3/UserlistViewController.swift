//
//  UserlistViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/5/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class UserlistViewController: UIViewController {

    var userInfo: [UserInfo] = []

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        addNameForUser()
        createUserAvatar()
    }

    private func addNameForUser() {
        var userInfo: [UserInfo] = []
        for i in 0...32 {
            userInfo.append(UserInfo(userNameIndex: "Name \(i + 1)"))
        }
        self.userInfo = userInfo
    }

    private func createUserAvatar() {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        let screenHeight = screen.size.height

        let avatarWidthGap = round(screenWidth / 4 - 300 / 4)
        let avatarHeightGap = round(screenHeight / 4 - 450 / 4)

        scrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        scrollView.contentSize = CGSize(width: screenWidth, height: avatarHeightGap * 12 + 150 * 11)
        view.addSubview(scrollView)

        for i in 0...32 {
            var x: CGFloat = avatarWidthGap
            let z: CGFloat = CGFloat(i / 3)
            let y: CGFloat = 150 * z + avatarHeightGap * (z + 1)
            if i % 3 == 1 {
                x = 100 + avatarWidthGap * 2
            } else if i % 3 == 2 {
                x = 200 + avatarWidthGap * 3
            } else {
                x = avatarWidthGap
            }

            let userView = UserView(frame: CGRect(x: x, y: y, width: 100, height: 150), userInfo: userInfo[i], index: i)
            userView.delegate = self
            scrollView.addSubview(userView)
        }
    }
}

extension UserlistViewController: UserViewDelegate {
    func view(_ view: UserView, needsPerform action: UserView.Action) {
        switch action {
        case .didTapSendUsername(index: let index):
            print("name \(userInfo[index].userNameIndex)")
            let viewController = UserDetailsViewController()
            let username = userInfo[index].userNameIndex
            viewController.username = username
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
