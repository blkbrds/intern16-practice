//
//  BaiTap4ViewController.swift
//  Navigation
//
//  Created by MacBook Pro on 7/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap4ViewController: UIViewController {

    // MARk: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNaviBar()
        view.backgroundColor = .white
    }
    
    // MARK: - Private functions
    private func configNaviBar() {
        title = "Gradient NavigationBar"
        let gradient = CAGradientLayer()
        let updatedFrame = self.navigationController!.navigationBar.bounds
        gradient.frame = updatedFrame
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        }
}

