//
//  BaiTap02.swift
//  BaiTapDraw
//
//  Created by PCI0004 on 7/13/20.
//  Copyright © 2020 PCI0004. All rights reserved.
//

import UIKit

final class BaiTap02: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        drawChart()

    }

    // MARK: - Private Function
    private func drawChart() {

        // Draw OXY
        let frameX = CGRect(x: 30, y: 250, width: 3, height: 300)
        let lineX = DrawLine(frame: frameX, backgroundColor: UIColor.black.cgColor)
        let frameY = CGRect(x: lineX.frame.origin.x, y: lineX.frame.maxY, width: 350, height: 3)
        let lineY = DrawLine(frame: frameY, backgroundColor: UIColor.black.cgColor)
        view.addSubview(lineX)
        view.addSubview(lineY)

        // Draw Circle
        let frameCircle = CGRect(x: 50, y: 250, width: 300, height: 300)
        let circleCustom = CircleCustom(frame: frameCircle)
        circleCustom.values = [1, 2, 3, 4]
        circleCustom.createCircle()
        view.addSubview(circleCustom)

    }
}
