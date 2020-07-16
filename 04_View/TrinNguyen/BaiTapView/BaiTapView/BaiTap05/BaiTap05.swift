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

                let newBluePoint = blueView.frame.origin
                let newBlueSize = blueView.frame.size
                let newWhitePoint = whiteView.frame.origin
                let newWhiteSize = whiteView.frame.size
                let newFrame: CGRect = CGRect(x: newBluePoint.x, y: newBluePoint.y, width: newBlueSize.width, height:
                        position.y - newWhitePoint.y)

                orangeView.center = CGPoint(x: whiteView.center.x, y: position.y)
                blueView.frame = newFrame
                numberLabel.text = "\(Int(newBlueSize.height / newWhiteSize.height * 100))"
            }
        }
    }
}
