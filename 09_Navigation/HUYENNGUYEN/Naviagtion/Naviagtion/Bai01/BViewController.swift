//  BViewController.swift
//  Naviagtion

import UIKit

class BViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
        nextButton.layer.cornerRadius = 20
        nextButton.layer.shadowOpacity = 10
        preButton.layer.cornerRadius = 20
        preButton.layer.shadowOpacity = 10
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let cViewControlller = CViewController()
        navigationController?.pushViewController(cViewControlller, animated: true)
    }
    @IBAction func preButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
