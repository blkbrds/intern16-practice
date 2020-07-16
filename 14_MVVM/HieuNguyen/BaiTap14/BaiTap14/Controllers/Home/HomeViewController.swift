//
//  HomeViewController.swift
//  BaiTap13
//
//  Created by PCI0020 on 7/16/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupSlideImage()
    }

    private func setupSlideImage() {
        let slideImage = Bundle.main.loadNibNamed("SlideImageView", owner: self, options: nil)?[0] as? SlideImageView
        slideImage?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(slideImage!)
        // contrains
        let topSafeArea: CGFloat = (UIApplication.shared.windows.first{$0.isKeyWindow }?.safeAreaInsets.top)! + (navigationController?.navigationBar.frame.height)!
        slideImage?.topAnchor.constraint(equalTo: view.topAnchor, constant: topSafeArea).isActive = true
        slideImage?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        slideImage?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        slideImage?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        

    }
}
