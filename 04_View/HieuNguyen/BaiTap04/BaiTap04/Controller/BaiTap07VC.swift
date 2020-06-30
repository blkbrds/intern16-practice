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
        let taptapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTap))
        monkeyImage.addGestureRecognizer(taptapGesture)
        
        let doubleTapTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTapTap.numberOfTapsRequired = 2
//        doubleTapTap.tim
        monkeyImage.addGestureRecognizer(doubleTapTap)

    }
    
    @objc func oneTap(recognizer: UITapGestureRecognizer) {
        print(" 1 tap ")
        print(viewMessage.frame)
        self.viewMessage.alpha = 1
        self.viewMessage.isHidden = false
        monkeyLabel.text = "Tôi là khỉ"
        UIView.animate(withDuration: 2, delay: 2, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.viewMessage.alpha = 0
        }, completion: { finished in
            self.viewMessage.isHidden = true
        })
    }
    @objc func doubleTap(recognizer: UITapGestureRecognizer){
        print("2 tap")
        self.viewMessage.isHidden = false
        monkeyLabel.text = "Khỉ là tôi"
        UIView.animate(withDuration: 2, delay: 2, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.viewMessage.alpha = 0
        }, completion: { finished in
            self.viewMessage.isHidden = true
        })
    }


    }
