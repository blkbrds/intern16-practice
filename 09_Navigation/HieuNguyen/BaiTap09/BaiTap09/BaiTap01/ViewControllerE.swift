//
//  ViewControllerE.swift
//  BaiTap09
//
//  Created by hieungq on 7/8/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class ViewControllerE: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"

    }
    
    @IBAction func cButtonTouchUpInside(_ sender: Any) {
        let viewControllers = navigationController?.viewControllers
        for vc in viewControllers! {
            if let viewControllerC = vc as? ViewControllerC {
                navigationController?.popToViewController(viewControllerC, animated: true)
            }
        }
    }
    @IBAction func bButtonTouchUpInside(_ sender: Any) {
        let viewControllers = navigationController?.viewControllers
      for vc in viewControllers! {
          if let viewControllerB = vc as? ViewControllerB {
              navigationController?.popToViewController(viewControllerB, animated: true)
          }
      }
        
    }
    
    @IBAction func dButtonTouchUpInside(_ sender: Any) {
        let viewControllers = navigationController?.viewControllers
      for vc in viewControllers! {
          if let viewControllerD = vc as? ViewControllerD {
              navigationController?.popToViewController(viewControllerD, animated: true)
          }
      }
    }
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
