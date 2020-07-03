//
//  BaiTap05.swift
//  ViewExample
//
//  Created by PCI0007 on 7/1/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap05: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var conternerView: UIView!
    @IBOutlet private weak var sliderView: UIView!
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var thumbView: UIView!
    @IBOutlet private weak var thumbLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(conternerView)
    }

    // MARK: - Override Function
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = touches.first {
        let position = touch.location(in: conternerView)
        if position.y <= sliderView.frame.maxY && position.y >= sliderView.frame.minY {
          thumbView.center = CGPoint(x: sliderView.center.x, y: position.y)
          loadingView.frame = CGRect(x: sliderView.frame.origin.x, y: sliderView.frame.origin.y, width: loadingView.frame.width, height: position.y - sliderView.frame.origin.y)
          let percentage = 100 * (1 - (loadingView.frame.height / sliderView.frame.height))
            thumbLabel.text = "\(Int(percentage))"
        }
      }
    }
}
