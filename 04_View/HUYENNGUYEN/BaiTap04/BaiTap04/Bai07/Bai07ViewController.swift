//  Bai07ViewController.swift
import UIKit

class Bai07ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var girlImageView: UIImageView!
    @IBOutlet weak var viewMessage: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private Methods
    private func configView() {
        girlImageView.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture1.numberOfTapsRequired = 1
        girlImageView.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2))
        tapGesture2.numberOfTapsRequired = 2
        girlImageView.addGestureRecognizer(tapGesture2)
        
        tapGesture1.require(toFail: tapGesture2)
    }
    
    // MARK: - IBActions
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        textLabel.text = "I'm girl"
        
    }
    
    @objc func handleTap2(_ sender: UITapGestureRecognizer) {
        textLabel.text = "I'm boy"
    }
}
