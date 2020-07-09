//
//  Bai7ViewController.swift
//  BaiTapView
//
//  Created by Trung Le D. on 7/2/20.
//  Copyright © 2020 Trung Le D. All rights reserved.
//

import UIKit

class Bai7ViewController: UIViewController {
    
    @IBOutlet weak var messegeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        messegeLabel.isHidden = true
        imageView.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(singleTapAction(_:)))
        singleTap.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action:#selector(doubleTapAction(_:)))
        doubleTap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
    }
    
    @objc func singleTapAction(_ sender: UITapGestureRecognizer) {
        messegeLabel.isHidden = false
        messegeLabel.text = "Tôi là khỉ"
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 3) {
            }
        }
        
    }
    @objc func doubleTapAction (_ sender: UITapGestureRecognizer)  {
        messegeLabel.isHidden = false
        messegeLabel.text = "Khỉ là tôi"
        self.messegeLabel.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            UIView.animate(withDuration: 3) {
                self.messegeLabel.alpha = 0
            }
        }
    }
    
    
}
