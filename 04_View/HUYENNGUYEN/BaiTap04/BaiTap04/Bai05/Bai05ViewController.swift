//  Bai05ViewController.swift
import UIKit

class Bai05ViewController: UIViewController {
    
    @IBOutlet weak var thumbView: UIView!
    @IBOutlet weak var thumbLabel: UILabel!
    @IBOutlet weak var changeView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         super.touchesMoved(touches, with: event)
        let touch = touches.first
        let location = touch?.location(in: containerView)
        if location!.y >= containerView.frame.minY, location!.y <= containerView.frame.maxY {
            thumbView.center = CGPoint(x: thumbView.center.x, y: location!.y - thumbView.bounds.height)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: containerView)
        thumbView.center.y = location!.y
        
        if location!.y >= containerView.frame.minY, location!.y <= containerView.frame.maxY {
            thumbView.center = CGPoint(x: thumbView.center.x, y: location!.y - thumbView.bounds.height)
        }
    }
    
}
