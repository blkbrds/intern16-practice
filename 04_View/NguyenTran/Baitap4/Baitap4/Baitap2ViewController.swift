//
//  Baitap2ViewController.swift
//
//
//  Created by MBA0245P on 7/1/20.
//

import UIKit

class Baitap2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        var names: [String] = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6", "Name 7", "Name 8", "Name 9"]

        //Add user avatar
        func addUserAvatar(x: CGFloat, y: CGFloat) -> UIImageView {
            let frame = CGRect(x: x, y: y, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            userAvatar.layer.borderWidth = 1
            userAvatar.layer.borderColor = UIColor.black.cgColor
            return userAvatar
        }

        //Add user name
        func addUserName(x: CGFloat, y: CGFloat, index: Int) -> UILabel {
            let userName = UILabel(frame: CGRect(x: x, y: y, width: 100, height: 50))
            userName.text = names[index]
            userName.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9333333333, blue: 0.7529411765, alpha: 1)
            userName.textColor = #colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)
            userName.textAlignment = .center
            return userName
        }

        //Add button
        func addUserButton(x: CGFloat, y: CGFloat, index: Int) -> UIButton {
            let userButton = UIButton(frame: CGRect(x: x, y: y, width: 100, height: 250))
            userButton.backgroundColor = .clear
            let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
            uiTapGestureRecognizer.name = names[index]
            userButton.addGestureRecognizer(uiTapGestureRecognizer)
            return userButton
        }

        //Tính khoảng cách chiều ngang, chiều dọc giữa các hình.
        //Các hình sẽ cách khung điện thoại và cách nhau những khoảng cách bằng nhau, tính toán dựa theo size màn hình
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        let screenHeight = screen.size.height

        let avatarWidthGap = round(screenWidth / 4 - 300 / 4)
        let avatarHeightGap = round(screenHeight / 4 - 450 / 4)

        //Vòng lặp for tạo 9 hình
        for i in 1...9 {
            var x: CGFloat = avatarWidthGap
            var y_avatar: CGFloat = avatarHeightGap
            var y_name: CGFloat = 200
            if i % 3 == 2 {
                x = 100 + avatarWidthGap * 2
            } else if i % 3 == 0 {
                x = 200 + avatarWidthGap * 3
            }
            switch i {
            case 4, 5, 6:
                y_avatar = 150 + avatarHeightGap * 2
                y_name = 250 + avatarHeightGap * 2
            case 7, 8, 9:
                y_avatar = 300 + avatarHeightGap * 3
                y_name = 400 + avatarHeightGap * 3
            default:
                y_avatar = avatarHeightGap
                y_name = avatarHeightGap + 100
            }

            let userAvatar = addUserAvatar(x: x, y: y_avatar)
            view.addSubview(userAvatar)
            let userName = addUserName(x: x, y: y_name, index: i - 1)
            view.addSubview(userName)
            let userButton = addUserButton(x: x, y: y_avatar, index: i - 1)
            view.addSubview(userButton)

        }

    }
    @objc private func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("\(userName ?? "no")")

    }
}
