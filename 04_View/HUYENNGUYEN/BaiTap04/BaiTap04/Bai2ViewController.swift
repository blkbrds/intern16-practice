//Bai tap 02
import UIKit

class Bai2ViewController: UIViewController {
    var names: [String] = ["UserName 1", "UserName 2", "UserName 3", "UserName 4", "UserName 5", "UserName 6"]
    var images: [String] = ["user", "user1", "user2", "user3", "user4", "user5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func listUser(frame: CGRect, index: Int) -> UIView {
            // add user avatar
            let frame = CGRect(x: 50, y: 50, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: "user1"))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            view.addSubview(userAvatar)
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
        
    }
    @objc func buttonOnClick() {
        print("Button is Clicked")
    }
}
