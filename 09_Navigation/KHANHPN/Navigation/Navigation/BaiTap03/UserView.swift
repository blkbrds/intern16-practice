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
//
//    var data: Data
//    var index: Int
    weak var delegate: UserViewDelegate?
//
//    init(data: Data, index: Int) {
//        self.data = data
//        self.index = index
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
//
//    func updateView() {
////        userImageView....
//        usernameButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControl.State#>)
//    }
    
//    func configUserView() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userButtonTouchUpInside))
//        tapGesture.name = usernameButton.titleLabel?.text
//        profileView.addGestureRecognizer(tapGesture)
//        profileView.isUserInteractionEnabled = true
//        addSubview(profileView)
//    }
    
    @IBAction func userButtonTouchUpInside(_ sender: UIButton) {
        delegate?.pushViewController(self, (sender.titleLabel?.text)!, index: 9)
    }
}
