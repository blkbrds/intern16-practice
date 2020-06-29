//
//  BaiTap02VC.swift
//  BaiTap04
//
//  Created by hieungq on 6/27/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

final class BaiTap02VC: UIViewController {
    
    struct Person {
        var image: UIImage
        var name: String
    }
    
    private var data:[Person] = [
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hieu Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ngoc Khanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Kim Oanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hoa Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Huyen Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Minh Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Tam Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Trin Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ha Van")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupImageView()
    }
    
    func setupImageView() {
        var x = 32
        var y = 64
        for i in 0..<self.data.count{
            if i % 3 == 0 && i != 0{
                y += 146
                x = 32
            } else if i != 0{
                x += 116
            }
            self.view.addSubview(avatarView(frame: CGRect(x: x, y: y, width: 100, height: 130),person: self.data[i], index: i))
        }
    }
    
    func avatarView(frame : CGRect,person: Person, index: Int) -> UIView {
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

