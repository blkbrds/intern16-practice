//
//  BaiTap2ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    // MARK: - Private Properties
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9"]
    private var images: [String] = ["avartar","avartar","avartar","avartar","avartar","avartar","avartar","avartar","avartar"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // TODO: khoang trống giữa tưng userview
        let space: CGFloat = 10
        // TODO: lấy chiều rộng màn hinh chinh
        let widthScreen = UIScreen.main.bounds.width
        //      let h = UIScreen.main.bounds.height
        //      print(widthScreen, h)
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 50
        var xView: CGFloat = space
        for index in 0..<names.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)
            // Tinh frame
            if xView + widthUserView > widthScreen - xView {
                yView += heightUserView + space
                xView = space
            } else {
                xView += widthUserView + space
            }
        }
    }
    
    //MARK: - Private Functions
    private func createUserView(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        //print(userView.bounds.width, userView.bounds.height)
        // Add avatar
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatar.image = UIImage(named: images[index])
        //TODO: scale hinh
        avatar.contentMode = .scaleToFill
        userView.addSubview(avatar)
        // Add label name
        let name = UILabel(frame: CGRect(x: 0, y: 140, width: userView.bounds.width, height: userView.bounds.height - avatar.bounds.height))
        name.text = names[index]
        name.textAlignment = .center
        name.backgroundColor = .lightGray
        name.textColor = .blue
        userView.addSubview(name)
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        //TODO: tạo sự kiện khi tap vào userview
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        //button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        userView.addSubview(button)
        return userView
    }
    //MARK: - Objc Funtion
    @objc private func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("\(userName ?? "no")")
    }
}
