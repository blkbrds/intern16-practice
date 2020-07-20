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
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9","Name10","Name11"]

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }

    // MARK: - Private funtions
    private func createUserView() {
        let screenSize = UIScreen.main.bounds
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 10, width: screenSize.width, height: screenSize.height))
        let space: CGFloat = 10
        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 165
        var yView: CGFloat = 10
        var xView: CGFloat = (screenSize.width - widthUserView * 3 - 2 * space) / 2
        let numberRow = names.count / 3
        let heightScroll = heightUserView * CGFloat(numberRow) + space * CGFloat((numberRow - 1))
        let heightScroll1 = heightUserView * (CGFloat(numberRow) + 1) + space * CGFloat((numberRow - 1))
        if names.count % 3 == 0 {
            scrollView.contentSize = CGSize(width: screenSize.width,
                                            height: heightScroll)
        } else {
            scrollView.contentSize = CGSize(width: screenSize.width, height:heightScroll1)
        }
        view.addSubview(scrollView)
        for i in 0..<names.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avartar = UserView(frame: frame)
            avartar.delegate = self
            avartar.usernameLabel.text = names[i]
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
extension BaiTap1ViewController: UserViewDelegate {
    func view(_ view: UserView, needsPerform action: UserView.Action) {
        switch action {
        case .didTapImage(nameLabel: let userName):
            print(userName)
        }
    }
}
