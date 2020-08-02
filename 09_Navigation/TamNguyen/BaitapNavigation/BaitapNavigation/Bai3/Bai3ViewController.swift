//
//  Bai3ViewController.swift
//  BaitapNavigation
//
//  Created by PCI0001 on 7/22/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - Properties
    private var names: [String] = ["Name1","Name2","Name3", "Name4","Name5","Name6","Name7", "Name8","Name9","Name10","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11","Name11"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserView()
    }
    
    // MARK: - Private funtions
    private func createUserView() {
        title = "Home"
        navigationController?.navigationBar.barTintColor = .black
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
        for index in 0..<names.count {
            let frame = CGRect(x: xView, y: yView, width: widthUserView, height: heightUserView)
            let avartar = Avatar(frame: frame, index: index, name: names[index])
            avartar.delegate = self
            avartar.usernameLabel.text = names[index]
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

//MARK: - AvatarViewDelegate
extension Bai3ViewController: AvatarViewDelegate {
    func view(_ view: Avatar, needsPerform action: Avatar.Action) {
        switch action {
        case .didTapImage(let userName, let image, let index):
            let nextViewVC = ProfileViewController()
            nextViewVC.username = userName
            nextViewVC.image = image
            nextViewVC.index = index
            navigationController?.pushViewController(nextViewVC, animated: true)
        }
    }
}
