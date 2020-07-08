//
//  ViewControllerB.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let ctrlC = ViewControllerC()
        navigationController?.pushViewController(ctrlC, animated: true)
    }
    @IBAction func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
