//
//  BaiTap10.swift
//  Autolayout
//
//  Created by PCI0007 on 7/13/20.
//  Copyright © 2020 Chipuscu. All rights reserved.
//

import UIKit

final class BaiTap10: UIViewController {
    
    // MARK: - Outlets:
    @IBOutlet private weak var firstSquare: UIView!
    @IBOutlet private weak var secondSquare: UIView!
    @IBOutlet private weak var thirdSquare: UIView!
    @IBOutlet private weak var fourthSquare: UIView!
    
    var biggestSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        biggestSquare = firstSquare
        configSquareTouchUpInside()
    }
    
    // MARK: - Private Functions:
    private func configSquareTouchUpInside() {
        firstSquare.isUserInteractionEnabled = true
        secondSquare.isUserInteractionEnabled = true
        thirdSquare.isUserInteractionEnabled = true
        fourthSquare.isUserInteractionEnabled = true
        
        let firstSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggestSquare))
        firstSquareTapGesture.name = "firstSquare"
        firstSquare.addGestureRecognizer(firstSquareTapGesture)
        
        let secondSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggestSquare))
        secondSquareTapGesture.name = "secondSquare"
        secondSquare.addGestureRecognizer(secondSquareTapGesture)
        
        let thirdSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggestSquare))
        thirdSquareTapGesture.name = "thirdSquare"
        thirdSquare.addGestureRecognizer(thirdSquareTapGesture)
        
        let fourthSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggestSquare))
        fourthSquareTapGesture.name = "fourthSquare"
        fourthSquare.addGestureRecognizer(fourthSquareTapGesture)
    }

    @objc private func checkBiggestSquare(_ tapGesture: UITapGestureRecognizer) {
        changeSize(view: biggestSquare, status: false)
        switch tapGesture.name {
            case "firstSquare":
                changeSize(view: firstSquare, status: true)
                biggestSquare = firstSquare
                biggestSquare.isUserInteractionEnabled = false
            case "secondSquare":
                changeSize(view: secondSquare, status: true)
                biggestSquare = secondSquare
                biggestSquare.isUserInteractionEnabled = false
            case "thirdSquare":
                changeSize(view: thirdSquare, status: true)
                biggestSquare = thirdSquare
                biggestSquare.isUserInteractionEnabled = false
            case "fourthSquare":
                changeSize(view: fourthSquare, status: true)
                biggestSquare = fourthSquare
                biggestSquare.isUserInteractionEnabled = false
            case .none, .some(_):
                return
            }
    }

    private func changeSize(view: UIView, status: Bool) {
        biggestSquare.isUserInteractionEnabled = true
        for contrains in view.constraints {
            if contrains.secondAttribute != .height && contrains.relation == .equal {
                UIView.animate(withDuration: 0.5) {
                    if status {
                        contrains.constant = view.frame.size.width * 2
                        view.isUserInteractionEnabled = true
                    } else {
                        contrains.constant = view.frame.size.width / 2
                    }
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}
