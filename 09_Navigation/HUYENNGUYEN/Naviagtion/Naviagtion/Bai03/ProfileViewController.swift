//  ProfileViewController.swift
//  Naviagtion
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    struct account {
        var names: String
        var images: String
    }
    let list = [account(names: "Username 1", images: "user"), account(names: "Username 2", images: "user"), account(names: "Username 3", images: "user"), account(names: "Username 4", images: "user"), account(names: "Username 5", images: "user"), account(names: "Username 6", images: "user"), account(names: "Username 7", images: "user"), account(names: "Username 8", images: "user"), account(names: "Username 9", images: "user"), account(names: "Username 10", images: "user"), account(names: "Username 11", images: "user"), account(names: "Username 12", images: "user"),account(names: "Username 13", images: "user"), account(names: "Username 14", images: "user")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
    }

    private func setView () {
        title = "Home"
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2500)
            let space: CGFloat = 10
            let widthScreen = scrollView.bounds.width

            let widthUserView: CGFloat = 110
            print(widthUserView)
            let heightUserView: CGFloat = 175
            var originX: CGFloat = 0
            var originY: CGFloat = space

        for index in 0..<list.count {
                let frame = CGRect(x: originX, y: originY, width: widthUserView, height: heightUserView)

                let avatar = ListUserView(frame: frame)
            avatar.delegate = self
            avatar.updateUI(imageName: list[index].images , name: list[index].names)
                scrollView.addSubview(avatar)

                // Tinh frame
                if originX + widthUserView > widthScreen - originX {
                    // Thay doi y va x
                    originY += heightUserView + space
                    originX = space
                } else {
                    originX += widthUserView + space
                }
            }
        }
    }
// MARK: - Extension
extension ProfileViewController: UserViewDelegate {
    func userView(view: UIView, avatar: String) {
        let profileView = ProfileUserViewController()
//        homeViewController.name = account.key
        
        navigationController?.pushViewController(profileView, animated: true)
    }
}
