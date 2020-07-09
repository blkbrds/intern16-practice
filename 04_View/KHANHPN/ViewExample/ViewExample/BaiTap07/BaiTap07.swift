//
//  BaiTap07.swift
//  ViewExample
//
//  Created by PCI0007 on 7/3/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap07: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var speechImageView: UIImageView!
    @IBOutlet private weak var speechLabel: UILabel!
    @IBOutlet private weak var speechView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configGesture()
    }
    
    // MARK: - Private functions
    private func configGesture() {
        monkeyImageView.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapGesture))
        singleTap.numberOfTapsRequired = 1
        monkeyImageView.addGestureRecognizer(singleTap)

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        doubleTap.numberOfTapsRequired = 2
        monkeyImageView.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
    }
    
    @objc private func singleTapGesture(recognizer: UITapGestureRecognizer) {
        speechLabel.text = "Tôi là khỉ"
        speechView.isHidden = false
        self.speechView.alpha = 1
        UIView.animate(withDuration: 2, delay: 2, options: .curveEaseIn, animations: {
            self.speechView.alpha = 0
        }, completion: { finished in
            self.speechView.isHidden = true
        })
    }
    
    @objc private func doubleTapGesture(recognizer: UITapGestureRecognizer) {
        print("double tap")
        speechLabel.text = "Khỉ là tôi"
        speechView.isHidden = false
        self.speechView.alpha = 1
        UIView.animate(withDuration: 2, delay: 2, options: .curveEaseIn, animations: {
            self.speechView.alpha = 0
        }, completion: { finished in
            self.speechView.isHidden = true
        })
    }
}
