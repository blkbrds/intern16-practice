//
//  BaiTap05.swift
//  BaiTapView
//
//  Created by PCI0004 on 7/2/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap05: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var outsideView: UIView!
    @IBOutlet private weak var whiteView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var numberLabel: UILabel!
      
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }
    
    // MARK: - Private Methods
    private func configTextField() {
        blueView.backgroundColor = .blue
        orangeView.backgroundColor = .orange
        whiteView.backgroundColor = .gray
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: outsideView)
            if position.y <= whiteView.frame.maxY && position.y >= whiteView.frame.minY {
                orangeView.center = CGPoint(x: whiteView.center.x, y: position.y)
                blueView.frame = CGRect(x: blueView.frame.origin.x, y: blueView.frame.origin.y, width: blueView.frame.width, height:
                    position.y - whiteView.frame.origin.y)
                numberLabel.text = "\(Int(blueView.frame.height / whiteView.frame.height * 100))"
            }
        }
    }
}
