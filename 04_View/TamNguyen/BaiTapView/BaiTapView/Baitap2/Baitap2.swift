//
//  Bai2.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/1/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai2ViewController: UIViewController {
    
    //MARK: -Properties
    var names :[String] = ["Thien", "Tam", "Nguyen", "Khanh", "Van", "Dat", "Tuan", "Trung", "Tinh"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: -Private Methods
    private func createUserView(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        
        // Add avatar
        let avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatarImageView.image = UIImage(named: "avatar_\(index)")
        avatarImageView.contentMode = .scaleToFill
        userView.addSubview(avatarImageView)
        
        // Add name
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - avatarImageView.bounds.height))
        nameLabel.text = names[index]
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .yellow
        userView.addSubview(nameLabel)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        userView.addSubview(button)
        return userView
    }
    
    private func configUI() {
        view.backgroundColor = .black
        let khoangCach: CGFloat = 10
        let widthScreen = UIScreen.main.bounds.width
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 200
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = khoangCach
        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            // Tinh frame
            if xUserView + widthUserView > widthScreen - xUserView {
                // Thay doi y va x
                yUserView += heightUserView + khoangCach
                xUserView = khoangCach
            } else {
                xUserView += widthUserView + khoangCach
            }
        }
    }
    
    @objc private func buttonDidClick(sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "Thien Tam")")
    }
}
