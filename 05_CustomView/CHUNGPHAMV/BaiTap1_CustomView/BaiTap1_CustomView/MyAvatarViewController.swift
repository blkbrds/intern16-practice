//
//  MyAvatarViewController.swift
//  BaiTap1_CustomView
//
//  Created by MBA0168 on 7/5/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyAvatarViewController: UIViewController {
    
    let images: [String] = ["avatar1.png", "avatar2.png", "avatar3.png","avatar4.png",  "avatar5.png", "avatar6.png", "avatar7.png", "avatar8.png", "avatar9.png"]
    let names: [String] = ["Chung", "Pham", "Van", "Ha", "Le", "Huong", "Nguyen", "An", "Ngoc"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // add scroll View
        let scrollView: UIScrollView = {
               let scroll = UIScrollView()
               scroll.isPagingEnabled = true
               scroll.showsVerticalScrollIndicator = false
               scroll.showsHorizontalScrollIndicator = false
               scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2200)
               return scroll
           }()
        view.addSubview(scrollView)
        
        //
        let space: CGFloat = 10
        let widthScreen = scrollView.bounds.width
        var x: CGFloat = 10
        var y: CGFloat = 0
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 100
        for i in 0..<images.count {
            let frame = CGRect(x: x, y: y, width: widthUserView, height: heightUserView)
            let userView = MyAvatar(frame: frame)
            userView.userAvatar?.image = UIImage(named: images[i])
            userView.userName?.text = names[i]
            userView.delegate = self
            scrollView.addSubview(userView)
            if x + widthUserView > widthScreen - x {
                y += heightUserView + space
                x = space
            } else {
                x += widthUserView + space
            }
            
        }
    }

}
extension MyAvatarViewController: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int) {
        print("Select user view with index \(index)")
    }
}
