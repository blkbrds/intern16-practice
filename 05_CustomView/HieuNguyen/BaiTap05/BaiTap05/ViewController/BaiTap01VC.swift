//
//  BaiTap01VC.swift
//  BaiTap05
//
//  Created by PCI0020 on 6/30/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap01VC: UIViewController {

    struct Person {
        var image: UIImage
        var name: String
    }

    private var data: [Person] = [
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hieu Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ngoc Khanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Kim Oanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hoa Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Huyen Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Minh Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Tam Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Trin Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ha Van"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hieu Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ngoc Khanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Kim Oanh"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Hoa Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Huyen Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Minh Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Tam Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Trin Nguyen"),
        Person(image: UIImage(named: "defaultProfileImage")!, name: "Ha Van"),
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
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    func setupImageView() {
           var x = 32
           var y = 64
           for i in 0..<self.data.count {
               if i % 3 == 0 && i != 0 {
                   y += 146
                   x = 32
               } else if i != 0 {
                   x += 116
               }
               userScrollView.addSubview(avatarView(frame: CGRect(x: x, y: y, width: 100, height: 130), person: self.data[i], index: i))
           }
       }



}
