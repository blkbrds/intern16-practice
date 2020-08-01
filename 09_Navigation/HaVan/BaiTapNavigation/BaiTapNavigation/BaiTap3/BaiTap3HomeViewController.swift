//
//  BaiTap3HomeViewController.swift
//  BaiTapNavigation
//
//  Created by NganHa on 7/22/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap3HomeViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var scrollView = UIScrollView()
    private var people: [People] = DataPeople.setDataOfPeople()
    private var index: Int = -1
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        configNavigationBar()
    }
    
    // MARK: - Private functions
    private func configNavigationBar() {
        title = "Home"
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

// MARK: - MyClassDelegate
extension BaiTap3HomeViewController: MyClassDelegate {
    
    func view(_ view: MyClass, needsPerform action: MyClass.Action) {
        switch action {
        case .didTapImage(let index):
            self.index = index
            let vc = ProfileViewController()
            vc.imageName = people[index].image
            vc.name = people[index].username
            vc.index = index
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - ProfileViewControllerDelegate
extension BaiTap3HomeViewController: ProfileViewControllerDelegate {
    
    func controller(_ viewController: ProfileViewController, needsPerform action: ProfileViewController.Action) {
        switch action {
        case .changeValue(index: let i, newName: let name):
            people[index].username = name
            for (index, view) in scrollView.subviews.enumerated() {
                if let subView = view as? MyClass, index == i, name == name {
                    subView.updateName(newName: name)
                }
            }
        }
    }
}
