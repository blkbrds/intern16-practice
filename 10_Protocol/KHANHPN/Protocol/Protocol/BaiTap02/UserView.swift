//
//  UserView.swift
//  Protocol
//
//  Created by PCI0007 on 7/24/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func pushViewController(_ personView: UserView, _ name: String, index: Int)
}

class UserView: UIView {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    
    weak var delegate: UserViewDelegate?
    var index: Int = 0
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    convenience init(frame: CGRect, index: Int, name: String = "") {
      self.init(frame: frame)
      self.index = index
    }

    @IBAction func userButtonTouchUpInside(_ sender: UIButton) {
        delegate?.pushViewController(self, (sender.titleLabel?.text)!, index: index)
    }
}
