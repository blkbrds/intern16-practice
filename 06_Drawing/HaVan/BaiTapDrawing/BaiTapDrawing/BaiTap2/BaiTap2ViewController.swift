//
//  BaiTap2ViewController.swift
//  BaiTapDrawing
//
//  Created by NganHa on 7/9/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap2ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCircleView()
    }
    
    //MARK: - Private functions
    private func configCircleView() {
        let screenSize = UIScreen.main.bounds.size
        let widthCircle: CGFloat = 300
        let circle = CircleGraphic(frame: CGRect(x: (screenSize.width - widthCircle) / 2, y: (screenSize.height - widthCircle) / 2, width: widthCircle, height: widthCircle), percent: 70)
        view.addSubview(circle)
    }
}
