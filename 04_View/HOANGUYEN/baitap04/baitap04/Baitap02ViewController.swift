//
//  baitap02ViewController.swift
//  baitap04
//
//  Created by NXH on 6/30/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap02ViewController: UIViewController {
    
    let avatarList: [String] = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6", "avatar7", "avatar8", "avatar9"]
    let nameList: [String] = ["Name1", "Name2", "Name3", "Name4", "Hà", "Hiếu", "Khánh", "Trin", "Huyền"]

    var createNameLabel = {() -> UILabel in
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.textAlignment = .center
        lbl.backgroundColor = .blue
        return lbl
    }
    
    var createAvatarImage = {() -> UIImageView in
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }
    
    @objc func printName(_ gesture: UITapGestureRecognizer) {
        print(gesture.name!)
    }
    
    func viewForPerson(img: UIImageView, lbl: UILabel) -> UIView {
        let uiView: UIView = UIView()
        uiView.addSubview(img)
        uiView.addSubview(lbl)
        img.frame = CGRect(x: uiView.frame.origin.x, y: uiView.frame.origin.y, width: 100, height: 130)
        lbl.frame = CGRect(x: img.frame.origin.x, y: img.frame.origin.y + 100, width: 100, height: 30)
        return uiView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var originX: Double = -100
        var originY: Double = 30
        for i in 0..<9 {
            let imgAvatar: UIImageView = createAvatarImage()
            let lblName: UILabel = createNameLabel()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(printName))
            let person: UIView = viewForPerson(img: imgAvatar, lbl: lblName)
            person.isUserInteractionEnabled = true
            tapGestureRecognizer.name = nameList[i]
            person.addGestureRecognizer(tapGestureRecognizer)
            imgAvatar.image = UIImage(named: "avatar\(i+1)")
            lblName.text = nameList[i]
            person.layer.borderWidth = 1
            person.layer.borderColor = UIColor.blue.cgColor
            person.layer.masksToBounds = true
            if originX < Double(self.view.frame.width) - 120 {
                originX += 120
                person.frame = CGRect(x: originX, y: originY, width: 100, height: 130)
                view.addSubview(person)
            }
            else {
                originX = 20
                originY += 150
                person.frame = CGRect(x: originX, y: originY, width: 100, height: 130)
                view.addSubview(person)
            }
        }
    }

}
