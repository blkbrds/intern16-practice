//
//  Bai1ViewController.swift
//  Bai5
//
//  Created by PCI0001 on 7/6/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//
import UIKit

class Bai1ViewController: UIViewController {
    
    // MARK: - Propeties
    let numberOfItems: Int = 30
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createListAvatar()
    }
    
    // MARK: - Private functions
    func createListAvatar() {
        let widthSizeScrollView: CGFloat = view.frame.width
        var originX: CGFloat = -100
        var originY: CGFloat = 20
        let scrollView: UIScrollView = UIScrollView(frame: view.frame)
        scrollView.backgroundColor = .gray
        scrollView.contentSize = CGSize(width: widthSizeScrollView, height: (150 * CGFloat(numberOfItems) / (widthSizeScrollView / 120)) + 100)
        view.addSubview(scrollView)
        for i in 0..<30 {
            if originX < view.frame.width - 120 {
                originX += 120
                let imageAvatar: AvatarView = AvatarView(frame: CGRect(x: originX, y: originY, width: 100, height: 130))
                imageAvatar.delegate = self
                scrollView.addSubview(imageAvatar)
                imageAvatar.userName.text = "Name\(i + 1)"
            } else {
                originX = 20
                originY += 150
                let imageAvatar: AvatarView = AvatarView(frame: CGRect(x: originX, y: originY, width: 100, height: 130))
                imageAvatar.delegate = self
                scrollView.addSubview(imageAvatar)
                imageAvatar.userName.text = "Name\(i + 1)"
            }
        }
    }
}

// MARK: - Extension MyAvatarDelegate
extension Bai1ViewController: MyAvatarDelegate {
    func viewPerson(_ person: AvatarView, string: String) {
        print(string)
    }
}
