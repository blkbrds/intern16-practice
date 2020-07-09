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
        
        let khoangCach: CGFloat = 10
        
        let widthScreen = UIScreen.main.bounds.width
        
        let widthUserView: CGFloat = 110
        
        let heightUserView: CGFloat = 175
        
        var yUs: CGFloat = 50
        
        var xUs: CGFloat = khoangCach
        
        for index in 0..<names.count {
            let frame = CGRect(x: xUs, y: yUs, width: widthUserView, height: heightUserView)
            
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            
            if xUs + widthUserView > widthScreen - xUs {
                
                yUs += heightUserView + khoangCach
                xUs = khoangCach
            } else {
                xUs += widthUserView + khoangCach
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
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        userView.addSubview(button)
        
        return userView
    }
    
    @objc private func buttonDidClick(sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "no name")")
    }
}
