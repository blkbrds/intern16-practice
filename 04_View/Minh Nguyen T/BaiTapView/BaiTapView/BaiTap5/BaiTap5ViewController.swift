//
//  BaiTap5ViewController.swift
//  BaiTapView
//
//  Created by MacBook Pro on 7/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class BaiTap5ViewController: UIViewController {
    // MARK: - IBOutlets
     @IBOutlet weak private var conternerView: UIView!
     @IBOutlet weak private var greenView: UIView!
     @IBOutlet weak private var blueView: UIView!
     @IBOutlet weak private var thumbView: UIView!
     @IBOutlet weak private var thumbLabel: UILabel!
     
     // MARK: - Life cycle
     override func viewDidLoad() {
         super.viewDidLoad()
         cusTomThumbView()
         // Do any additional setup after loading the view.
     }
     // MARK: - Private Functions
     private func cusTomThumbView(){
         thumbView.layer.cornerRadius = thumbView.frame.width / 2
     }
     // MARK: - Function
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         //super.touchesMoved(touches, with: event)
         if let touch = touches.first{
             let position = touch.location(in: conternerView)
             //print("\(position.y)")
             if position.y <= blueView.frame.maxY && position.y >= blueView.frame.minY{
                 thumbView.center = CGPoint(x: blueView.center.x, y: position.y)
                 //greenView.frame = CGRect(x: blueView.frame.origin.x, y: blueView.frame.origin.y, width: greenView.frame.width, height: position.y - blueView.frame.origin.y)
                 greenView.frame = CGRect(x: greenView.frame.origin.x, y: greenView.frame.origin.y, width: greenView.frame.width, height: position.y - blueView.frame.origin.y)
                 let Phantram = 100 * (1 - (greenView.frame.height / blueView.frame.height))
                 thumbLabel.text = "\(Int((Phantram)))"
             }
         }
     }
}
