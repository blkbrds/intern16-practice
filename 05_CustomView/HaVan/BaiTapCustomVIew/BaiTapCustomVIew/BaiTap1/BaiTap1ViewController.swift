//
//  BaiTap1ViewController.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - Propeties
    private var scrollView = UIScrollView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
    }
    
    // MARK: - Private functions
    private func setDataOfPeople() -> [People] {
        var people: [People] = []
        for i in 0...30 {
            people.append(People(username: "Name \(i + 1)", image: "avatar.png"))
        }
        return people
    }
    
    private func createScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        let people: [People] = setDataOfPeople()
        var x = 30
        var y = 30
        for index in 0..<people.count - 1{
            if index % 3 == 0 {
                x = 30
            } else {
                x += 110
            }
            if x == 30 && index != 0 {
                y += 150
            }
            let personView = MyClass(frame: CGRect(x: x, y: y, width: 100, height: 130))
            personView.usernameLabel?.text = people[index].username
            personView.imageView?.image = UIImage(named: people[index].image)
            personView.delegate = self
            scrollView.addSubview(personView)
        }
        scrollView.contentSize = CGSize(width: view.bounds.width, height: (130 + 20) * 10 + 30)
        view.addSubview(scrollView)
    }
}

//MARK: - Extention
extension BaiTap1ViewController: MyClassDelegate {
    func view(_ view: MyClass, needsPerform action: MyClass.Action) {
        switch action {
        case .didTapImage(nameLabel: let name):
            print(name)
        }
    }
}
