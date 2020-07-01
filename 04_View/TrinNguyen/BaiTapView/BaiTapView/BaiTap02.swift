import UIKit

class BaiTap02: UIViewController {

    var x: CGFloat = 30
    var y: CGFloat = 80
    
    struct User {
        var name: String
        var image: UIImageView
    }

    let datas: [User] = [
        User(name: "a", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "b", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "c", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "d", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "e", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "f", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "g", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "h", image: UIImageView(image: UIImage(named: "img_avatar_01"))),
        User(name: "j", image: UIImageView(image: UIImage(named: "img_avatar_01")))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for index in 1...datas.count {
            let frame = CGRect(x: x, y: y, width: 100, height: 100)
            //tao doi tuong view
            let userAvatar = datas[index-1].image
            //gan gia tri cho thuoc tinh view
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            //add view vao superview
            view.addSubview(userAvatar)
            // Add user name
            let userName = UILabel(frame: CGRect(x: x, y: y+100, width: 100, height: 50))
            userName.text = datas[index-1].name
            userName.backgroundColor = .lightGray
            userName.textColor = .blue
            userName.textAlignment = .center
            view.addSubview(userName)
            //add button
            let button = UIButton(frame: CGRect(x: x, y: y, width: 100, height: 250))
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
            view.addSubview(button)
            x += 110
            if index % 3 == 0 {
                y += 160
                x = 30
            }
        }
        
    }
    
    @objc func buttonDidClick() {
        print("Button is locked!!!")
    }
}

