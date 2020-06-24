//
//  HomeViewController.swift
//  BaiTap1
//
//  Created by NganHa on 6/23/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapPressed(_ sender: UIButton) {
        self.view.backgroundColor = randomColor()
    }
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0 ... 1)
        let blue = CGFloat.random(in: 0 ... 1)
        let green = CGFloat.random(in: 0 ... 1)
        let alpha = CGFloat.random(in: 0 ... 1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
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
