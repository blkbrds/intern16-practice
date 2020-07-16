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
        slideImage?.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 300)
        self.view.addSubview(slideImage!)
    }
}
