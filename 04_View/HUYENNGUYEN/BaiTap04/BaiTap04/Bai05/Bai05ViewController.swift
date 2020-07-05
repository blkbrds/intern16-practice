//  Bai05ViewController.swift
import UIKit

final class Bai05ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbLabel: UILabel!
    @IBOutlet private weak var thumbView: UIView!
    @IBOutlet private weak var blueView: UIView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Private Methods
    private func configView() {
        thumbView.layer.borderWidth = 1
        thumbView.layer.cornerRadius = 20
        thumbView.layer.borderColor = UIColor.black.cgColor
        
        thumbLabel.text = "0 %"
        thumbLabel.layer.cornerRadius = 20
        thumbLabel.clipsToBounds = true
        thumbLabel.center = CGPoint(x: thumbView.frame.midX, y: thumbView.frame.maxY)
        
        blueView.layer.cornerRadius = 20
        blueView.frame = CGRect(x: thumbView.frame.maxX, y: thumbView.frame.maxY, width: 0, height: 0)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(Bai05ViewController.handlePanGesture(sender:)))
        thumbLabel.addGestureRecognizer(panGestureRecognizer)
    }
    
    // MARK: - objc func
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if thumbLabel.center.y + translation.y >= thumbView.frame.minY && thumbLabel.center.y + translation.y <= thumbView.frame.maxY {
            thumbLabel.center = CGPoint(x: thumbLabel.center.x, y: thumbLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            blueView.frame = CGRect(x: thumbView.frame.minX, y: thumbLabel.center.y, width: thumbView.frame.width, height: thumbView.frame.maxY - thumbLabel.center.y)
            thumbLabel.text = "\(Int((thumbView.frame.maxY - thumbLabel.center.y) / (thumbLabel.frame.maxY - thumbView.frame.minY) * 100)) %"
        } else if thumbLabel.center.y + translation.y < thumbView.frame.minY {
            thumbLabel.text = "100 %"
        }
    }
}
