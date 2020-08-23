//
//  Bai2ViewController.swift
//  Drawing
//
//  Created by Abcd on 7/16/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configCircleView()
    }
    
    //MARK: - Private functions
    private func configCircleView() {
        let screenSize = UIScreen.main.bounds.size
        let widthCircle: CGFloat = 300
        let circle = CircleChart(frame: CGRect(x: (screenSize.width - widthCircle) / 2, y: (screenSize.height - widthCircle) / 2, width: widthCircle, height: widthCircle), percent: 50)
        view.addSubview(circle)
    }
    
}
