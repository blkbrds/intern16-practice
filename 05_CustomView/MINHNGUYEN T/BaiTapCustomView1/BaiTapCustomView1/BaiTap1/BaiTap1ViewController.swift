//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
class BaiTap1ViewController: UIViewController {
    //MARK: - Private Properties
    private let numberUser: Int = 30
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9","Name10","Name11","Name12","Name13", "Name14","Name15","Name16","Name17", "Name18","Name19","Name20","Name21","Name22","Name23", "Name24","Name25","Name26","Name27", "Name28","Name29","Name30"]
    private var images: [String] = ["avartar","avartar","avartar","avartar","avartar","avartar","avartar","avartar","avartar"]

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUser()
    }

    //MARK: -Private Funtions
    private func createUser(){
        let scrollView: UIScrollView!
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 50, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 1900)
        let space: CGFloat = 10
        // TODO: lấy chiều rộng màn hinh chinh
        let widthScreen = UIScreen.main.bounds.width
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 50
        var xView: CGFloat = space
        view.addSubview(scrollView)
        for i in 0..<numberUser {
            let User = UserView(frame: CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView))
            User.delegate = self
            User.username?.text = names[i]
            scrollView.addSubview(User)
            // Tinh frame
            if xView + widthUserView > widthScreen - xView {
                yView += heightUserView + space
                xView = space
            } else {
                xView += widthUserView + space
            }
        }
    }
}
//print("name: \(user ?? "noname")")

// MARK: - UserViewDelegate
extension BaiTap1ViewController: UserViewDelegate {
    func view(_ view: UserView, needsPerform action: UserView.Action) {
        switch action {
        case .didTapImage(nameLabel: let userName):
            print(userName)
        }
    }
}
