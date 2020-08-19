//
//  AvatarViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0004 on 7/22/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

// MARK: - Configure
private struct Configure {
    static let titleName = "Home"
}

final class AvatarViewController: UIViewController {

    // MARK: - Properties
    struct Avatar {
        var name: String
        var imageName: String
    }

    var avatars: [Avatar] = [
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "2", imageName: "img_avatar_01"),
        Avatar(name: "3", imageName: "img_avatar_01"),
        Avatar(name: "4", imageName: "img_avatar_01"),
        Avatar(name: "5", imageName: "img_avatar_01"),
        Avatar(name: "6", imageName: "img_avatar_01"),
        Avatar(name: "7", imageName: "img_avatar_01"),
        Avatar(name: "8", imageName: "img_avatar_01"),
        Avatar(name: "9", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01"),
        Avatar(name: "1", imageName: "img_avatar_01")
    ]

    // MARK: - Properties
    var x: CGFloat = 40
    var y: CGFloat = 70
    var customAvatar = CustomAvatarView()
    let profile = ProfileViewController()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configUI()
    }

    // MARK: - Private Functions
    private func configUI() {
        let screenSize = UIScreen.main.bounds
        let widthScreen = screenSize.width
        let heightScreen = screenSize.height

        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen))
        scrollView.contentSize = CGSize(width: widthScreen, height: 1280)
        view.backgroundColor = .white
        view.addSubview(scrollView)

        for index in 1...avatars.count {
            customAvatar = CustomAvatarView(frame: CGRect(x: x, y: y, width: 100, height: 125))
            customAvatar.delegate = self
            customAvatar.avatarImageView = UIImageView(image: UIImage(named: avatars[index - 1].imageName))
            customAvatar.usernameLabel.text = avatars[index - 1].name
            scrollView.addSubview(customAvatar)
            x += 120
            if index % 3 == 0 {
                y += 160
                x = 40
            }
        }
    }
}

// MARK: - CustomAvatarDelegate, ProfileViewControllerDelegate
extension AvatarViewController: CustomAvatarViewDelegate {
    func setValue(_ customAvatarView: CustomAvatarView, setValueAvatar action: CustomAvatarView.Action) {
        var temp: Int = 0
        switch action {
        case .setValueAvatar(let username, let imageView):
            let profile = ProfileViewController()
            profile.name = username
            profile.imageName = imageView
            for index in 1...avatars.count where username == avatars[index - 1].name {
                temp = index - 1
            }
            profile.index = temp
            navigationController?.pushViewController(profile, animated: true)
        }
    }
}

extension AvatarViewController: ProfileViewControllerDelegate {
    func changeUser(_ profile: ProfileViewController, changeName action: ProfileViewController.Action) {
        switch action {
        case .changeName(let username, let index):
            avatars[index].name = username
        }
    }
}
