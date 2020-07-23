//
//  UserView.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func pushViewController(_ personView: UserView, _ name: String, index: Int)
}

final class UserView: UIView {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    
    weak var delegate: UserViewDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func userButtonTouchUpInside(_ sender: UIButton) {
        delegate?.pushViewController(self, (sender.titleLabel?.text)!, index: 9)
    }
}
