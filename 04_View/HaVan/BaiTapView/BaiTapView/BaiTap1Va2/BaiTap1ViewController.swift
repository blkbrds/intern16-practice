//
//  BaiTap1ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addUserAvatar(withImage: "avatar.png"))
        view.addSubview(addUsername(withName: "Name"))
    }
    
    // MARK: - Private functions
    // create an avatar
    private func addUserAvatar(withImage image: String) -> UIImageView {
        let frame = CGRect(x: 30, y: 30, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleAspectFill
        userAvatar.clipsToBounds = true
        return userAvatar
    }
    
    // create an username
    private func addUsername(withName text : String) -> UILabel {
        let username = UILabel(frame: CGRect(x: 30, y: 130, width: 100, height: 30))
        username.text  = text
        username.textAlignment = .center
        username.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        username.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return username
    }
}
