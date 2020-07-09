//
//  Bai55ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/2/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit
class Bai55ViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var bigView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    //MARK: - Function
    private func setupButton() {
        buttonLabel.text = "50%"
        buttonLabel.textColor = UIColor.white
        buttonLabel.textAlignment = .center
        buttonLabel.font = UIFont.systemFont(ofSize: 24.0)
        buttonLabel.layer.cornerRadius = buttonLabel.frame.height / 2
        buttonLabel.layer.borderWidth = 3.0
        buttonLabel.layer.masksToBounds = true
        buttonLabel.layer.borderColor = UIColor.orange.cgColor
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.center = CGPoint(x: bigView.frame.midX, y: bigView.frame.midY)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let localtion = touch.location(in: self.view)
            if   localtion.y >= bigView.frame.minY,
                localtion.y <= bigView.frame.maxY {
                buttonLabel.center = CGPoint(x: bigView.center.x, y: localtion.y)
                smallView.frame = CGRect(x: bigView.frame.origin.x, y: bigView.frame.origin.y, width: smallView.frame.width, height: localtion.y - bigView.frame.origin.y)
                let percent = 100 * (1 - smallView.frame.height / bigView.frame.height)
                buttonLabel.text = "\(Int(percent))%"
            }
        }
    }
}
