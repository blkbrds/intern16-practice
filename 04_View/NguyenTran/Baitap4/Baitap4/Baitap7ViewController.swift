//
//  Baitap7ViewController.swift
//  Baitap4
//
//  Created by MBA0245P on 7/6/20.
//  Copyright © 2020 Tran Thao Nguyen. All rights reserved.
//

import UIKit

class Baitap7ViewController: UIViewController {

    @IBOutlet weak var monkeyImage: UIImageView!

    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var textView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImage.isUserInteractionEnabled = true
        textView.alpha = 0
        textView.addSubview(textLabel)

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapMonkey))
        tapGesture.numberOfTapsRequired = 1
        monkeyImage.addGestureRecognizer(tapGesture)
        
        let doubleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapMonkey))
        doubleTapGesture.numberOfTapsRequired = 2
        monkeyImage.addGestureRecognizer(doubleTapGesture)
    }

    @objc func tapMonkey(sender: UITapGestureRecognizer) {
        if sender.numberOfTapsRequired == 2 {
            textLabel.text = "Khỉ là tôi."
        } else {
            textLabel.text = "Tôi là khỉ."
            
        }
        if textView.alpha == 1 {
            let time = DispatchTime.now() + 5
            DispatchQueue.main.asyncAfter(deadline: time) {
                UIView.transition(with: self.textView, duration: 5, options: .curveEaseInOut, animations: {
                    self.textView.alpha = 0
                    self.view.layoutIfNeeded()
                })
            }
        } else {
            UIView.transition(with: self.textView, duration: 5, options: .curveEaseInOut, animations: {
                self.textView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
}
