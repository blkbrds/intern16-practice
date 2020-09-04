//
//  SecondViewController.swift
//  ExampleNavigation
//
//  Created by Abcd on 7/21/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerB"
        // Do any additional setup after loading the view.
    }

    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func push(_ sender: Any) {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
