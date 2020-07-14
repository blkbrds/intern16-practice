//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    //MARK: - Private Properties
    private let numberUser: Int = 30
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9","Name10","Name11","Name12","Name13", "Name14","Name15","Name16","Name17", "Name18","Name19","Name20","Name21","Name22","Name23", "Name24","Name25","Name26","Name27", "Name28","Name29","Name30"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }
    
    //MARK: -Private Funtions
    private func createUserView() {
        let scrollView: UIScrollView!
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: screenWidth, height: screenHeight))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 50
        var xView: CGFloat = space
        let heightScroll = Int(screenSize.height) * 3 - (numberUser / 3 * Int(space))
        scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(heightScroll))
        view.addSubview(scrollView)
        for i in 0..<numberUser {
            let uSer = UserView(frame: CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView))
            uSer.delegate = self
            uSer.usernameLabel?.text = names[i]
            scrollView.addSubview(uSer)
            if xView + widthUserView > screenWidth - xView {
                yView += heightUserView + space
                xView = space
            } else {
                xView += widthUserView + space
            }
        }
    }
}

// MARK: - UserViewDelegate
extension BaiTap1ViewController: UserViewDelegate {
    func view(_ view: UserView, needsPerform action: UserView.Action) {
        switch action {
        case .didTapImage(nameLabel: let userName):
            print(userName)
        }
    }
}
