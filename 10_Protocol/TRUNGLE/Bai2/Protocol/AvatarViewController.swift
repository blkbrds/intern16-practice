//
//  AvatarViewController.swift
//  Protocol
//
//  Created by Trung Le D. on 7/24/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

struct Avatar {
    var name: String
    var imageNam: String
}

class AvatarViewController: UIViewController {
  
    @IBOutlet weak var scrollView: UIScrollView!
    var coordinatesX: CGFloat = 10
    var coordinatesY: CGFloat = 10
    var spacingImage: CGFloat = 40
    var names: [String] = ["Trung1","Trung2","Trung3","Trung4","Trung5","Trung6","Trung7","Trung8","Trung9","Trung10","Trung11","Trung12","Trung13","Trung14","Trung15","Trung16","Trung17","Trung18","Trung19","Trung20","Trung21","Trung22","Trung23","Trung24","Trung25","Trung26","Trung27","Trung28","Trung29","Trung30"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadAvatar()
    }
    
    func loadAvatar() {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.85)
        for i in 1...30 {
            let avatar = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView
            if let avatar = avatar {
                avatar.frame = CGRect(x: coordinatesX, y: coordinatesY, width: (UIScreen.main.bounds.width - spacingImage) / 3, height: (UIScreen.main.bounds.width - spacingImage) / 3)
                avatar.tag = i
                coordinatesX += avatar.frame.width + 10
                avatar.userName = names[i - 1]
                avatar.avatarViewDelegate = self
                if i % 3 == 0 {
                    coordinatesY += (UIScreen.main.bounds.width - spacingImage) / 3 + 10
                    coordinatesX = 10
                }
                avatar.updateName()
                scrollView.addSubview(avatar)
            }
        }
    }
}

extension AvatarViewController: AvatarViewDelegate {
    func updateUser(userName: String, image: String, index: Int) {
        let vc = ProfileViewController()
        vc.profileViewControllerDelegate = self
        vc.userName = userName
        vc.imageView = image
        vc.index = index
        if let navigation = navigationController {
            navigation.pushViewController(vc, animated: true)
        }
    }
}

extension AvatarViewController: ProfileViewControllerDelegate {
    func controller(controller: ProfileViewController, needPerfomAction action: ProfileViewController.Action) {
        switch action {
        case .updateData(let newName, let index):
            guard index > 0 && index <= names.count, let newName = newName else { return }
            names[index - 1] = newName
            for subView in scrollView.subviews {
                if let avataView = subView as? AvatarView, avataView.tag == index {
                    avataView.userName = names[index - 1]
                    avataView.updateName()
                }
            }
        }
    }
}
