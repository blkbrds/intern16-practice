//
//  FirstViewController.swift
//  ExampleNavigation
//
//  Created by Abcd on 7/21/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerA"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           print("view Will Disappear")
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           print("view Did Disappear")
       }
    @IBAction func push(_ sender: Any) {
        let vc = SecondViewController()
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
