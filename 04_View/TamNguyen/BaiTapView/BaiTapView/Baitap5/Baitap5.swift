//
//  B5.swift
//  TAMNGUYEN
//
//  Created by PCI0001 on 7/8/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai5ViewController: UIViewController {
    
    //MARK: - IBOulet
    @IBOutlet private weak var bigView: UIView!
    @IBOutlet private weak var smallView: UIView!
    @IBOutlet private weak var thumbLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupThumb()
    }
    
    //MARK: - Private Methods
    private func setupThumb() {
        thumbLabel.text = "50%"
        thumbLabel.textAlignment = .center
        thumbLabel.backgroundColor = .cyan
        thumbLabel.layer.cornerRadius = thumbLabel.frame.height / 2
        thumbLabel.layer.borderWidth = 3
        thumbLabel.translatesAutoresizingMaskIntoConstraints = false
        thumbLabel.center = CGPoint(x: bigView.frame.midX, y: bigView.frame.midY)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: self.view)
            if location.y >= bigView.frame.minY,
                location.y <= bigView.frame.maxY {
                thumbLabel.center = CGPoint(x: bigView.center.x, y: location.y)
                smallView.frame = CGRect(x: bigView.frame.origin.x, y: bigView.frame.origin.y, width: smallView.frame.width, height: location.y - bigView.frame.origin.y)
                let percent = 100 * (1 - smallView.frame.height / bigView.frame.height)
                thumbLabel.text = "\(Int(percent))%"
            }
        }
    }
}
