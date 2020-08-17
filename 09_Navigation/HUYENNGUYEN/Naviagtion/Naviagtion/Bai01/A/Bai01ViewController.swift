//  Bai01ViewController.swift
//  Naviagtion

import UIKit

class Bai01ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        nextButton.layer.cornerRadius = 20
        nextButton.layer.shadowOpacity = 10
        title = "ViewController A"
    }
    
    // MARK: - Action
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let bViewController = BViewController()
        navigationController?.pushViewController(bViewController, animated: true)
    }
}
