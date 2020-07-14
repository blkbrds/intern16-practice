//  Bai07ViewController.swift
import UIKit

final class Bai07ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var girlImageView: UIImageView!
    @IBOutlet private weak var viewMessage: UIImageView!
    
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
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        textLabel.text = "I'm girl"
        
    }
    
    @objc private func handleTap2(_ sender: UITapGestureRecognizer) {
        textLabel.text = "I'm boy"
    }
}
