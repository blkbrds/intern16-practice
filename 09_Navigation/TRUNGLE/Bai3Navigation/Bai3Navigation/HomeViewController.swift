//
//  HomeViewController.swift
//  Bai3Navigation
//
//  Created by Trung Le D. on 7/22/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var postionX: CGFloat = 10
    var postionY: CGFloat = 10
    var spacing: CGFloat = 40
    var names: [String] = ["jackeylove","theShy","Sofm","Faker","Ronaldo","messi","cantona","ramos","marcelo","bale","jackeylove","theShy","Sofm","Faker","Ronaldo","messi","cantona","ramos","marcelo","bale","jackeylove","theShy","Sofm","Faker","Ronaldo","messi","cantona","ramos","marcelo","bale"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadAvatar()
        }
    }
    
    func loadAvatar() {
        for index in 1...30 {
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)
            let avatar = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView
            if let avatar = avatar {
                avatar.frame = CGRect(x: postionX, y: postionY, width: (UIScreen.main.bounds.width - spacing) / 3, height: (UIScreen.main.bounds.width - spacing) / 3)
                avatar.userName = names[index - 1]
                avatar.avatarviewDelegate = self
                avatar.tag = index
                postionX += (UIScreen.main.bounds.width - spacing) / 3 + 10
                if index % 3 == 0 {
                    postionY += (UIScreen.main.bounds.width - spacing) / 3 + 10
                    postionX = 10
                }
                avatar.updateUser()
                scrollView.addSubview(avatar)
            }
        }
    }
}

extension HomeViewController: AvatarViewDelegate {
    func touchesAvatar(userName: String, imageView: String, index: Int) {
        let profileViewController = ProfileViewController()
        profileViewController.userName = userName
        profileViewController.imageView = imageView
        profileViewController.index = index
        profileViewController.profileViewControllerDelegate = self
        if let navigationController = navigationController {
            navigationController.pushViewController(profileViewController, animated: true)
        }
    }
}

extension HomeViewController: ProfileViewControllerDelegate {
    func updateAvatarTextField(userName: String, index: Int) {
        guard index > 0 && index <= names.count else {
            return
        }
        names[index - 1] = userName
        for subView in scrollView.subviews {
            if let avatar = subView as? AvatarView, avatar.tag == index {
                avatar.userName = names[index - 1]
                avatar.updateUser()
            }
        }
    }
}
