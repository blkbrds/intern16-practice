//
//  BaiTap1ViewController.swift
//  BaiTapCustomVIew
//
//  Created by NganHa on 7/3/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap1ViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var scrollView = UIScrollView()
    private var people: [People] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
    }
    
    // MARK: - Private functions
    private func setDataOfPeople() {
        var people: [People] = []
        for i in 0..<29 {
            people.append(People(username: "Name \(i + 1)", image: "avatar.png"))
        }
        self.people = people
    }

    private func numberOfRows() -> Int {
        if people.count > 0 {
            if people.count % 3 == 0 {
                return people.count / 3
            } else {
                return people.count / 3 + 1
            }
        }
        return 0
    }
    
    private func createScrollView() {
        setDataOfPeople()
        let screenSize: CGSize = UIScreen.main.bounds.size
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        let personViewWidth: CGFloat = 100
        let personViewHeight: CGFloat = 130
        let personViewHorizontalSpacing: CGFloat = 10
        let personViewVerticalSpacing: CGFloat = 20
        let positonX: CGFloat = ((screenSize.width - 3 * personViewWidth - 2 * personViewHorizontalSpacing) / 2)
        var x: CGFloat  = positonX
        var y: CGFloat = 30
        guard people.count > 0 else { return }
        for index in 0..<people.count {
            if index % 3 == 0 {
                x = positonX
            } else {
                x += personViewHorizontalSpacing + personViewWidth
            }
            if x == positonX && index != 0 {
                y += personViewVerticalSpacing + personViewHeight
            }
            let personView = MyClass(frame: CGRect(x: x, y: y, width: personViewWidth, height: personViewHeight), people: people[index], index: index)
            personView.delegate = self
            scrollView.addSubview(personView)
        }
        var spacing: CGFloat = 0
        if numberOfRows() > 1 {
            spacing += CGFloat(numberOfRows() - 1) * personViewVerticalSpacing
        }
        scrollView.contentSize = CGSize(width: screenSize.width, height: personViewHeight * CGFloat(numberOfRows()) + spacing + 40)
        view.addSubview(scrollView)
    }
}

//MARK: - MyClassDelegate
extension BaiTap1ViewController: MyClassDelegate {
    func view(_ view: MyClass, needsPerform action: MyClass.Action) {
        switch action {
        case .didTapImage(let index):
            let name = people[index].username
            print("\(name)")
        }
    }
}
