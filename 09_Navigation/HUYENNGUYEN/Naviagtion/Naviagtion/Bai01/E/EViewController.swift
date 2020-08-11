//  EViewController.swift
//  Naviagtion

import UIKit

class EViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    
    // MARK: - Action
    @IBAction func dButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cButtonTouchUpInside(_ sender: Any) {
        let cView = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(cView, animated: true)
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: Any) {
        let bView = (self.navigationController?.viewControllers[2])!
        navigationController?.popToViewController(bView, animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
