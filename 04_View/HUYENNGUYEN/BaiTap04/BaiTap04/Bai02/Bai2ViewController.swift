//Bai tap 02
import UIKit

struct account {
    var names: String
    var images: String
}
let list = [account(names: "Username 1", images: "user"),account(names: "Username 2", images: "user1"),account(names: "Username 3", images: "user2"),account(names: "Username 4", images: "user3"),account(names: "Username 5", images: "user4"),account(names: "Username 6", images: "user5")]
//var names: [String] = ["UserName 1", "UserName 2", "UserName 3", "UserName 4", "UserName 5", "UserName 6"]
//var images: [String] = ["user", "user1", "user2", "user3", "user4", "user5"]
final class Bai2ViewController: UIViewController {
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - private method
    private func setView () {
        let margin: CGFloat = 15
        let widthScreen = UIScreen.main.bounds.width
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 170
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = margin
        
        for index in 0..<list.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let avatarView = listUser(frame: frame, index: index)
            view.addSubview(avatarView)
            if xUserView + widthUserView > widthScreen - xUserView {
                yUserView += heightUserView + margin
                xUserView = margin
            } else {
                xUserView += widthUserView + margin
            }
        }
    }

    private func listUser(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        
        // add user avatar
        let userAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        userAvatar.image = UIImage(named: (list[index].images))
        userAvatar.contentMode = .scaleToFill
        userAvatar.layer.masksToBounds = true
        userView.addSubview(userAvatar)
        
        // add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - userAvatar.bounds.height))
        userName.text = list[index].names
        userName.textAlignment = .center
        userName.backgroundColor = .systemBlue
        userName.layer.shadowOpacity = 2
        userName.layer.shadowRadius = 5
        userName.textColor = .white
        userView.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonOnClick))
        button.tag = index
        button.addGestureRecognizer(tap)
        userView.addSubview(button)
        
        return userView
    }
    
    // MARK: - objc
    @objc private func buttonOnClick(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            let index = view.tag
            print("User name is: Name \(index + 1)")
        }
    }
}
