//
//  BaiTap5ViewController.swift
//  BaiTapView
//
//  Created by NganHa on 7/1/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap5ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var thumbLabel: UILabel!
    @IBOutlet private weak var thumbView: UIView!
    @IBOutlet private weak var processView: UIView!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        thumbView.layer.cornerRadius = 25
    }
    
    // MARK: - Private functions
    private func changeProcessView(with y: CGFloat) {
        let preciousY = processView.frame.origin.y
        let height = processView.bounds.height
        processView.frame = CGRect(x: processView.frame.origin.x , y: y, width: 40, height: height + (preciousY - y))
        let number =  ( processView.frame.height / containerView.frame.height) * 100
        thumbLabel.text = String(format: "%.0f", number)
    }
    
    // MARK: - Public functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         let location = touch?.location(in: containerView)
         if location!.y < containerView.bounds.minY {
              thumbView.center.y = containerView.bounds.minY
         } else if location!.y > containerView.bounds.maxY {
             thumbView.center.y = containerView.bounds.maxY
         } else {
             thumbView.center.y = location!.y
         }
         
         changeProcessView(with: thumbView.center.y)
        
         
     }
     
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         let location = touch?.location(in: containerView)
         if location!.y < containerView.bounds.minY {
                     thumbView.center.y = containerView.bounds.minY
                } else if location!.y > containerView.bounds.maxY {
                    thumbView.center.y = containerView.bounds.maxY
                } else {
                    thumbView.center.y = location!.y
                }
         changeProcessView(with: thumbView.center.y)
     
     }

}
