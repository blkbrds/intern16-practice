//
//  Avatar.swift
//  baitap05
//
//  Created by NXH on 7/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func viewPerson(_ person: Avatar, str: String)
}

class Avatar: UIView {
    var createLblName = {() -> UILabel in
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.backgroundColor = .blue
        return lbl
    }()
    
    var createImgAvatar = {() -> UIImageView in
        let img = UIImageView()
        img.image = UIImage(named: "avatar")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    
    weak var delegate: MyAvatarDelegate?
    
    @objc func tapPerson(_ sender: Any) {
        delegate?.viewPerson(self, str: createLblName.text!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(createImgAvatar)
        self.addSubview(createLblName)
        createImgAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        createLblName.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPerson(_:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
