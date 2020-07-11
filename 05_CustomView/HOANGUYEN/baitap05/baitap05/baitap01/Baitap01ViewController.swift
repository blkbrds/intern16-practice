//
//  baitap01ViewController.swift
//  baitap05
//
//  Created by NXH on 7/2/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap01ViewController: UIViewController {
    
// MARK: - Propeties
    let listUser: [User] = [User(nameUser: "Name1", avatarUser: "avatar"), User(nameUser: "Name2", avatarUser: "avatar"), User(nameUser: "Name3", avatarUser: "avatar"), User(nameUser: "Name4", avatarUser: "avatar"), User(nameUser: "Name5", avatarUser: "avatar"), User(nameUser: "Name6", avatarUser: "avatar"), User(nameUser: "Name7", avatarUser: "avatar"), User(nameUser: "Name8", avatarUser: "avatar"), User(nameUser: "Name9", avatarUser: "avatar"), User(nameUser: "Name10", avatarUser: "avatar"), User(nameUser: "Name11", avatarUser: "avatar"), User(nameUser: "Name12", avatarUser: "avatar"), User(nameUser: "Name13", avatarUser: "avatar"), User(nameUser: "Name14", avatarUser: "avatar"), User(nameUser: "Name15", avatarUser: "avatar"), User(nameUser: "Name16", avatarUser: "avatar"), User(nameUser: "Name17", avatarUser: "avatar"), User(nameUser: "Name18", avatarUser: "avatar"), User(nameUser: "Name19", avatarUser: "avatar"), User(nameUser: "Name20", avatarUser: "avatar"), User(nameUser: "Name21", avatarUser: "avatar"), User(nameUser: "Name22", avatarUser: "avatar"), User(nameUser: "Name23", avatarUser: "avatar"), User(nameUser: "Name24", avatarUser: "avatar"), User(nameUser: "Name25", avatarUser: "avatar"), User(nameUser: "Name26", avatarUser: "avatar"), User(nameUser: "Name27", avatarUser: "avatar"), User(nameUser: "Name28", avatarUser: "avatar"), User(nameUser: "Name29", avatarUser: "avatar"), User(nameUser: "Name30", avatarUser: "avatar")]
    
// MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createListAvatar()
    }

// MARK: - Private functions
    private func createListAvatar() {
        var avatarItems: Avatar!
        let widthSizeScrollView: CGFloat = UIScreen.main.bounds.width
        let sizeContentOnLine: CGFloat = 100 * 3 + 20 * 2
        var originX: CGFloat = CGFloat(Float((widthSizeScrollView - sizeContentOnLine) / 2)) - 120
        var originY: CGFloat = 20
        let uiScrollView: UIScrollView = UIScrollView(frame: view.frame)
        uiScrollView.backgroundColor = .green
        // giới hạn size Scroll View
//        tinh height lai
        view.addSubview(uiScrollView)
        for index in 0..<listUser.count {
            if originX < CGFloat(Float(widthSizeScrollView - (widthSizeScrollView - sizeContentOnLine) / 2)) - 120 {
                originX += 120
            } else {
                originX = CGFloat(Float((UIScreen.main.bounds.width - sizeContentOnLine) / 2))
                originY += 150
            }
            avatarItems = Avatar(frame: CGRect(x: originX, y: originY, width: 100, height: 130), user: listUser[index], index: index)
            avatarItems.delegate = self
            uiScrollView.addSubview(avatarItems)
        }
        uiScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: avatarItems.frame.maxY)
    }
}

// MARK: - Extension
extension Baitap01ViewController: AvatarDelegate {
    func view(_ person: Avatar, needsPerform: Avatar.Action) {
        switch needsPerform {
        case .tap(let index):
            print(listUser[index].nameUser)
        }
    }
}
