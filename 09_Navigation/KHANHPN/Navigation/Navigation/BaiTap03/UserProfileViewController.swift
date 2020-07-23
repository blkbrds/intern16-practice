//
//  UserProfileViewController.swift
//  Navigation
//
//  Created by PCI0007 on 7/20/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

struct Data {
    var name: String
    var image: UIImage?
}

class UserProfileViewController: UIViewController {
    var datas: [Data] = [
        Data(name: "User 1", image: UIImage(named: "img-avatar")),
        Data(name: "User 2", image: UIImage(named: "img-avatar")),
        Data(name: "User 3", image: UIImage(named: "img-avatar")),
        Data(name: "User 4", image: UIImage(named: "img-avatar")),
        Data(name: "User 5", image: UIImage(named: "img-avatar")),
        Data(name: "User 6", image: UIImage(named: "img-avatar")),
        Data(name: "User 7", image: UIImage(named: "img-avatar")),
        Data(name: "User 8", image: UIImage(named: "img-avatar")),
        Data(name: "User 9", image: UIImage(named: "img-avatar")),
        Data(name: "User 10", image: UIImage(named: "img-avatar")),
        Data(name: "User 2gd", image: UIImage(named: "img-avatar")),
        Data(name: "User 2dfg", image: UIImage(named: "img-avatar")),
        Data(name: "User 2sdfdsf", image: UIImage(named: "img-avatar")),
        Data(name: "User dsfs2", image: UIImage(named: "img-avatar")),
        Data(name: "Userer 2", image: UIImage(named: "img-avatar")),
        Data(name: "User aer2", image: UIImage(named: "img-avatar")),
        Data(name: "Userdsf 2", image: UIImage(named: "img-avatar")),
        Data(name: "Useradsfsg 2", image: UIImage(named: "img-avatar")),
        Data(name: "Userfgbh 2", image: UIImage(named: "img-avatar")),
        Data(name: "Userwetg 2", image: UIImage(named: "img-avatar")),
        Data(name: "Userwergtthj 2", image: UIImage(named: "img-avatar")),
        Data(name: "UserFDG2sdfdsf", image: UIImage(named: "img-avatar")),
        Data(name: "UserFDG dsfs2", image: UIImage(named: "img-avatar")),
        Data(name: "UsereDFGr 2", image: UIImage(named: "img-avatar")),
        Data(name: "UserDFG aer2", image: UIImage(named: "img-avatar")),
        Data(name: "UserdsDFGf 2", image: UIImage(named: "img-avatar")),
        Data(name: "UseradDFGsfsg 2", image: UIImage(named: "img-avatar")),
        Data(name: "UserfgDbh 2", image: UIImage(named: "img-avatar")),
        Data(name: "UserwetDFGg 2", image: UIImage(named: "img-avatar")),
        Data(name: "UserweWrgtthj 2", image: UIImage(named: "img-avatar"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Home"
        customHomeVC()
    }

    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    func customHomeVC() {
        var scrollHeight: CGFloat = 180

        var x = 32
        var y = 0
        for i in 0..<datas.count {
            if i % 3 == 0 && i != 0 {
                y += 160
                x = 32
                scrollHeight += 160
            } else if i % 3 != 0 {
                x += 130
            }
            guard let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView else { return }
            userView.frame = CGRect(x: x, y: y, width: 100, height: 130)
            userView.delegate = self
            userView.usernameButton.setTitle(datas[i].name, for: .normal)
            scrollView.addSubview(userView)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: scrollHeight)
        view.addSubview(scrollView)
    }
}

extension UserProfileViewController: UserViewDelegate {
//    func pushViewController(_ personView: UserView, data: Data, index: Int) {
//        <#code#>
//    }
    
    func pushViewController(_ personView: UserView, _ name: String, index: Int) {
        let userDetailsViewController = UserDetailsViewController()
        userDetailsViewController.userName = name
//        userDetailsViewController.delegate = self
        
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}

//extension UserProfileViewController: UserDetailsDelegate {
//    func userDetails(viewController: UserDetailsViewController, data: Data, index: Int) {
//        datas[index] = data
//    }
//}
