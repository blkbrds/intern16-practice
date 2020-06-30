//
//  PersonView.swift
//  BaiTap05
//
//  Created by PCI0020 on 6/30/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class PersonView: UIView {

   

    func avatarView(frame: CGRect, person: Person, index: Int) -> UIView {
        let profileView = UIView()
        profileView.frame = frame
        let avatarImage = UIImageView(image: person.image)
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        profileView.addSubview(avatarImage)
        let nameLabel = UILabel()
        nameLabel.text = person.name
        nameLabel.font = UIFont(name: "Menlo", size: 16)
        nameLabel.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.isUserInteractionEnabled = true
        profileView.addSubview(nameLabel)
        let tap = UITapGestureRecognizer(target: self, action: #selector(printInfo(_:)))
        tap.name = String(index)
        profileView.addGestureRecognizer(tap)
        profileView.isUserInteractionEnabled = true
        return profileView
    }

    @objc func printInfo(_ gesture: UITapGestureRecognizer) {
        for i in 0..<data.count {
            if gesture.name == String(i) {
                print(data[i].name)
            }
        }
    }

}
