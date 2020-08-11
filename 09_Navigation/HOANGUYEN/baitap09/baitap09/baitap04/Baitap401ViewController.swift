//
//  Baitap4011ViewController.swift
//  baitap09
//
//  Created by NXH on 7/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap401ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientNaviBar()
    }
    
    // MARK: - Private Function
    private func gradientNaviBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        title = "Gradient NavigationBar"
        let gradientLayer = CAGradientLayer()
        let flareRed = UIColor(displayP3Red: 255.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        let flareOrange = UIColor(displayP3Red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        if let updatedFrame = navigationController?.navigationBar.bounds {
            gradientLayer.frame = updatedFrame
        }
        gradientLayer.colors = [flareRed.cgColor, flareOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let naviController = navigationController {
            naviController.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
    }
}
