//  CViewController.swift
//  Naviagtion

import UIKit

class CViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    @IBOutlet weak var rootButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Function
    private func configUI() {
        title = "ViewController C"
        nextButton.layer.cornerRadius = 20
        nextButton.layer.shadowOpacity = 10
        preButton.layer.cornerRadius = 20
        preButton.layer.shadowOpacity = 10
        rootButton.layer.cornerRadius = 20
        rootButton.layer.shadowOpacity = 10
    }
    
    // MARK: - Action
    @IBAction func nextButtonAction(_ sender: Any) {
        let dViewController = DViewController()
        navigationController?.pushViewController(dViewController, animated: true)
    }
    
    @IBAction func preButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
