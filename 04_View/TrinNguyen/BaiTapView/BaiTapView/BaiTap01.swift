import UIKit

class BaiTap01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add user avatar
        //xd view con trong view cha
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        //tao doi tuong view
        let userAvatar = UIImageView(image: UIImage(named: "img_avatar_01"))
        //gan gia tri cho thuoc tinh view
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        //add view vao superview
        view.addSubview(userAvatar)

        // Add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "User Name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)

        //add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonDidClick() {
        print("Button is locked!!!")
    }

}

