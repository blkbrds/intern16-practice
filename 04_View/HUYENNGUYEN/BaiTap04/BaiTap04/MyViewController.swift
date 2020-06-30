//Bai tap 01
import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add user avatar
        let frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "user"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 160, width: 100, height: 25))
        userName.text = "UserName"
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        userName.layer.shadowOpacity = 2
        userName.layer.shadowRadius = 5
        view.addSubview(userName)
        
    }
    @objc func buttonOnClick() {
        print("Button is Clicked")
    }
}
