//
//  BaiTap2ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 6/29/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    // MARK: - Properties
    private var people: [People] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSmallViewintoView()
    }
    
    // MARK: - Private functions
    // create an avatar
    private func addUserAvatar(withImage image: String) -> UIImageView {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleAspectFill
        userAvatar.clipsToBounds = true
        return userAvatar
    }
    
    // create label
    private func addUsername(withName text : String) -> UILabel {
        let username = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        username.text  = text
        username.textAlignment = .center
        username.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        username.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return username
    }
    
    // create a small view that contain an avatar and a username
    private func createSmallView(withImage imgName: String, withName text: String, x: CGFloat, y: CGFloat, index i : Int) -> UIView {
        let uiView = UIView(frame: CGRect(x: x, y: y, width: 100 , height: 130))
        let tap = UITapGestureRecognizer(target: self, action: #selector(printInfo))
        tap.name = String(i)
        uiView.addGestureRecognizer(tap)
        // permit user interact
        uiView.isUserInteractionEnabled = true
        uiView.addSubview(addUserAvatar(withImage: imgName))
        uiView.addSubview(addUsername(withName: text))
        return uiView
    }

    //create an array data
    private func createDataArray() -> [People] {
        let people: [People] = [People(img: "avatar.png","Name 1"),
                                People(img: "avatar.png","Name 2"),
                                People(img: "avatar.png","Name 3"),
                                People(img: "avatar.png","Name 4"),
                                People(img: "avatar.png","Name 5"),
                                People(img: "avatar.png","Name 6"),
                                People(img: "avatar.png","Name 7"),
                                People(img: "avatar.png","Name 8"),
                                People(img: "avatar.png","Name 9")]
        return people
    }
    
    private func addSmallViewintoView() {
        var x: Int = 30
        var y: Int = 30
        people = createDataArray()
        for index in 0...people.count - 1 {
            if index % 3 == 0 {
                x = 30
            } else {
                x += 110
            }
            if x == 30 && index != 0 {
                y += 150
            }
            view.addSubview(createSmallView(withImage: people[index].nameImage, withName: people[index].name, x: CGFloat(x), y: CGFloat(y), index: index))
        }
    }
    
    // MARK: objc funtions
    @objc func printInfo(_ gesture: UITapGestureRecognizer) {
        guard let name = gesture.name,
            let index = Int(name) else { return }
        if index < people.count {
            print(people[index].name)
        }
    }
}
