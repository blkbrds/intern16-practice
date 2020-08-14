//
//  BaiTap3ViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap3ViewController: UIViewController {
    
    // MARK: - Properties
    private var datas = [Data (name: "user1", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),
                         Data (name: "user2", nameImage: "image1"),]
    private var scrollView = UIScrollView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
        title = "Home"
    }
    
    // MARK: - Private funtions
    private func createUserView() {
        let screenSize = UIScreen.main.bounds
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: screenSize.width, height: screenSize.height))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 10
        var xView: CGFloat = (screenSize.width - widthUserView * 3 - 2 * space) / 2
        let numberRow = datas.count / 3
        let heightScroll = heightUserView * CGFloat(numberRow) + space * CGFloat((numberRow - 1))
        let heightScroll1 = heightUserView * (CGFloat(numberRow) + 1) + space * CGFloat((numberRow - 1))
        if datas.count % 3 == 0 {
            scrollView.contentSize = CGSize(width: screenSize.width,
                                            height: heightScroll)
        } else {
            scrollView.contentSize = CGSize(width: screenSize.width, height:heightScroll1)
        }
        view.addSubview(scrollView)
        for index in 0..<datas.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avartar = UserView(frame: frame, index: index)
            avartar.delegate = self
            avartar.usernameLabel.text = datas[index].name
            scrollView.addSubview(avartar)
            if xView + widthUserView > screenSize.width - xView {
                yView += heightUserView + space
                xView = (screenSize.width - widthUserView * 3 - 2 * space) / 2
            } else {
                xView += widthUserView + space
            }
        }
    }
}

// MARK: - UserViewDelegate
extension BaiTap3ViewController: UserViewDelegate {
    func view(_ view: UserView, needsPerform action: UserView.Action) {
        switch action {
        case .didTapImage(nameLabel: let userName , nameImage: let nameImage, let index):
            let vc = ProfileViewController()
            vc.username = userName
            vc.nameImage = nameImage
            vc.index = index
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - ProfileViewControllerDelegate
extension BaiTap3ViewController : ProfileViewControllerDelegate {
    func changeNameUser(_ controller: ProfileViewController, needsPerfrom action: ProfileViewController.Action) {
        switch action {
        case .changNameUser(username: let name, index: let index):
            datas[index].name = name
            for (indexView, subView) in scrollView.subviews.enumerated() {
                if let view = subView as? UserView, indexView == index {
                    view.usernameLabel.text = datas[index].name
                }
            }
        }
    }
}
