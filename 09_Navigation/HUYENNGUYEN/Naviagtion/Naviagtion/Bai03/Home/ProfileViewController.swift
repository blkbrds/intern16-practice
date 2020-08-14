//  ProfileViewController.swift
//  Naviagtion
import UIKit

class ProfileViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - Function
    private func setView () {
        title = "Home"
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2500)
        let space: CGFloat = 10
        let widthScreen = scrollView.bounds.width
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var originX: CGFloat = 0
        var originY: CGFloat = space
        
        for index in 0..<list.count {
            let frame = CGRect(x: originX, y: originY, width: widthUserView, height: heightUserView)
            
            let avatar = ListUserView(frame: frame)
            avatar.delegate = self
            avatar.updateUI(imageName: list[index].images, name: list[index].names)
            scrollView.addSubview(avatar)
            avatar.tag = index
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

// MARK: - Extension UserViewDelegate
extension ProfileViewController: UserViewDelegate {
    func userView(userName: String, imageView: String, index: Int) {
        let vc = ProfileUserViewController()
        vc.delegate = self
        vc.name = userName
        vc.imageView = imageView
        vc.index = index
        if let navigation = navigationController {
            navigation.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - Extension ProfileUserViewControllerDelegate
extension HomeViewController: ProfileUserViewControllerDelegate {
    func controller(controller: ProfileUserViewController, needPerformAction action: ProfileUserViewController.Action) {
        switch action {
        case .updateName(let newName, let index):
            guard index > 0 && index <= list.count, let newName = newName else { return }
            list[index - 1].names = newName
            for subView in scrollView.subviews {
                if let avataView = subView as? AvatarView, avataView.tag == index {
                    avataView.userName = names[index - 1]
                    avataView.updateName()
                }
            }
        }
    }
}
