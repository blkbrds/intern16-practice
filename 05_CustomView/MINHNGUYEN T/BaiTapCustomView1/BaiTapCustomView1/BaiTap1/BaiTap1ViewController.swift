//
//  BaiTap4ViewController.swift
//  BaiTapCustomView1
//
//  Created by MacBook Pro on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - Properties
    private let numberUser: Int = 30
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9","Name10","Name11","Name12","Name13", "Name14","Name15","Name16","Name17", "Name18","Name19","Name20","Name21","Name22","Name23", "Name24","Name25","Name26","Name27", "Name28","Name29","Name30"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }
    
    // MARK: - Private funtions
    private func createUserView() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 0
        //var xView: CGFloat = UIScreen.main.bounds.width - 
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height:
            heightUserView * CGFloat((names.count / 3)) - space)
        var xView : CGFloat = space
        let widthScreen = scrollView.bounds.width
        view.addSubview(scrollView)
        for i in 0..<numberUser {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avartar = UserView(frame: frame)
            avartar.delegate = self
            avartar.usernameLabel.text = names[i]
            scrollView.addSubview(avartar)
            if xView + widthUserView > widthScreen - xView {
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
