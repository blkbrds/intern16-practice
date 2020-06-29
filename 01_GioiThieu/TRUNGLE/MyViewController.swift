//
//  MyViewController.swift
//  Demo1
//
//  Created by Trung Le D. on 6/23/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

       var backgroundNumber = 0
    var backgroundColor = [UIColor.red, UIColor.yellow, UIColor.black, UIColor.blue]

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {
        if backgroundNumber < backgroundColor.count - 1 {
            backgroundNumber += 1
        } else {
            backgroundNumber = 0
        }
        self.view.backgroundColor = self.backgroundColor[self.backgroundNumber]
     
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
