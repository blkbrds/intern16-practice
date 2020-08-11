//
//  Baitap4011ViewController.swift
//  baitap09
//
//  Created by NXH on 7/16/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

class Baitap401ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientNaviBar()
        // Do any additional setup after loading the view.
    }
    
    private func gradientNaviBar() {
        let gradientLayer = CAGradientLayer()
        let flareRed = UIColor(displayP3Red: 241.0 / 255.0, green: 39.0 / 255.0, blue: 17.0 / 255.0, alpha: 1.0)
        let flareOrange = UIColor(displayP3Red: 245.0 / 255.0, green: 175.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
        if var updatedFrame = navigationController?.navigationBar.bounds {
            updatedFrame.size.height += 20
            gradientLayer.frame = updatedFrame
        }
        gradientLayer.colors = [flareRed.cgColor, flareOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // vertical gradient start
        gradientLayer.endPoint = CGPoint(x: 1, y: 0) // vertical gradient end
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let naviController = navigationController {
            naviController.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
