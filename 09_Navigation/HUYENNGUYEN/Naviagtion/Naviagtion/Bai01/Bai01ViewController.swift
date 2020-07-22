//  Bai01ViewController.swift
//  Naviagtion

import UIKit

class Bai01ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.shadowOpacity = 10
        title = "ViewController A"
        //navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let bViewController = BViewController()
        navigationController?.pushViewController(bViewController, animated: true)
    }
    
}
