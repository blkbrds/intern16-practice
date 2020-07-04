//Bai tap 02
import UIKit

class Bai2ViewController: UIViewController {
    var names: [String] = ["UserName 1", "UserName 2", "UserName 3", "UserName 4", "UserName 5", "UserName 6"]
    var images: [String] = ["user", "user1", "user2", "user3", "user4", "user5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin: CGFloat = 10
        let widthScreen = UIScreen.main.bounds.width
        
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 150
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = margin
        
        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: 50, height: 100)
            
            let userView = listUser(frame: frame, index: index)
            view.addSubview(userView)
            
            // Tinh frame
            if xUserView + widthUserView > widthScreen - xUserView {
                // Thay doi y va x
                yUserView += heightUserView + margin
                xUserView = margin
            } else {
                xUserView += widthUserView + margin
            }
        }
    }
    
    func listUser(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)
        
        // add user avatar
        let userAvatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        userAvatar.image = UIImage(named: (images[index]))
        userAvatar.contentMode = .scaleToFill
        userAvatar.layer.masksToBounds = true
        userView.addSubview(userAvatar)
        //
        // add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - userAvatar.bounds.height))
        userName.text = names[index]
        userName.backgroundColor = .white
        userName.layer.borderColor = UIColor.gray.cgColor
        userName.textAlignment = .center
        userName.textColor = .blue
        userName.layer.shadowOpacity = 2
        userName.layer.shadowRadius = 5
        userView.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonOnClick))
        uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        userView.addSubview(button)
        
        return userView
    }
    
    @objc private func buttonOnClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "no name")")
    }
}
