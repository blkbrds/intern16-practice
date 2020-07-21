//
//  ThirdViewController.swift
//  ExampleNavigation
//
//  Created by Abcd on 7/21/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title  = "ViewController C"
        // Do any additional setup after loading the view.
    }

    @IBAction func pop(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    @IBAction func push(_ sender: Any) {
        let vc = FourthViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popToRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
