//
//  Bai2ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/1/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {
    var names : [String] = ["an", "binh", "hanh", "phuc", "phat", "dat", "diem", "trung","tinh"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let spacing: CGFloat = 10
        let widthScreen = UIScreen.main.bounds.width
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = spacing
        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            if xUserView + widthUserView > widthScreen - xUserView {
                yUserView += heightUserView + spacing
                xUserView = spacing
            } else {
                xUserView += widthUserView + spacing
            }
        }
    }
    func createUserView(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        // Add avatar
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatar.image = UIImage(named: "avatar_\(index)")
        avatar.contentMode = .scaleToFill
        userView.addSubview(avatar)
        // Add name
        let name = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - avatar.bounds.height))
        name.text = names[index]
        name.textAlignment = .center
        name.backgroundColor = .yellow
        userView.addSubview(name)
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        button.tag = index
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        userView.addSubview(button)
        return userView
    }
    @objc private func buttonDidClick(sender: UIButton) {
        print(names[sender.tag])
    }
}
