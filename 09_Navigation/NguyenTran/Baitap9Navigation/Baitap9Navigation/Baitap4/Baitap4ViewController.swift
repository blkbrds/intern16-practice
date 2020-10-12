//
//  Baitap4ViewController.swift
//  Baitap9Navigation
//
//  Created by MBA0245P on 10/12/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gradient NavigationBar"
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            let gradientFrame = navigationBar.bounds
            gradient.frame = gradientFrame
            gradient.colors = [UIColor.init(red: 212 / 250, green: 252 / 250, blue: 121 / 250, alpha: 1).cgColor, UIColor.init(red: 150 / 250, green: 230 / 250, blue: 161 / 250, alpha: 1).cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            UIGraphicsBeginImageContext(gradient.bounds.size)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }
    }

    func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
