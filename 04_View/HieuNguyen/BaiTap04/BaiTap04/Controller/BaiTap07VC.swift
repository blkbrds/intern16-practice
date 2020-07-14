//
//  BaiTap07VC.swift
//  BaiTap04
//
//  Created by hieungq on 6/29/20.
//  Copyright © 2020 hieungq. All rights reserved.
//

import UIKit

class BaiTap07VC: UIViewController {

    @IBOutlet weak var viewMessage: UIView!
    @IBOutlet weak var monkeyLabel: UILabel!
    @IBOutlet weak var monkeyImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImage.isUserInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTapGesture))
        singleTapGesture.numberOfTouchesRequired = 1
        monkeyImage.addGestureRecognizer(singleTapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(twoTapGesture))
        doubleTapGesture.numberOfTapsRequired = 2
        monkeyImage.addGestureRecognizer(doubleTapGesture)
        
        singleTapGesture.require(toFail: doubleTapGesture)
    }
    
    @objc func oneTapGesture(recognizer: UITapGestureRecognizer) {
        self.viewMessage.alpha = 1
        self.viewMessage.isHidden = false
        monkeyLabel.text = "Tôi là khỉ"
        UIView.animate(withDuration: 2, delay: 2, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.viewMessage.alpha = 0
        }, completion: { finished in
            self.viewMessage.isHidden = true
        })
    }
    
    @objc func twoTapGesture(recognizer: UITapGestureRecognizer) {
        self.viewMessage.alpha = 1
        self.viewMessage.isHidden = false
        monkeyLabel.text = "Khỉ là tôi"
        UIView.animate(withDuration: 2, delay: 2, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.viewMessage.alpha = 0
        }, completion: { finished in
            self.viewMessage.isHidden = true
        })
    }
}
