//
//  BaiTap10.swift
//  BaiTap07
//
//  Created by hieungq on 7/3/20.
//  Copyright © 2020 hieu.ngq. All rights reserved.
//

import UIKit

class BaiTap10VC: UIViewController {

    @IBOutlet weak var firstSquare: UIView!
    @IBOutlet weak var secondSquare: UIView!
    @IBOutlet weak var thirdSquare: UIView!
    @IBOutlet weak var fourthSquare: UIView!
    var biggestSquare = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        biggestSquare = firstSquare
        setupTouchInside()
    }

    private func setupTouchInside() {
        firstSquare.isUserInteractionEnabled = true
        secondSquare.isUserInteractionEnabled = true
        thirdSquare.isUserInteractionEnabled = true
        fourthSquare.isUserInteractionEnabled = true
        
        let firstSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggest))
        firstSquareTapGesture.name = "firstSquare"
        firstSquare.addGestureRecognizer(firstSquareTapGesture)
        
        let secondSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggest))
        secondSquareTapGesture.name = "secondSquare"
        secondSquare.addGestureRecognizer(secondSquareTapGesture)
        
        let thirdSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggest))
        thirdSquareTapGesture.name = "thirdSquare"
        thirdSquare.addGestureRecognizer(thirdSquareTapGesture)
        
        let fourthSquareTapGesture = UITapGestureRecognizer(target: self, action: #selector(checkBiggest))
        fourthSquareTapGesture.name = "fourthSquare"
        fourthSquare.addGestureRecognizer(fourthSquareTapGesture)
    }

    @objc private func checkBiggest(_ tapGesture: UITapGestureRecognizer) {
        // zoom in biggest square
        changeSizeSquare(view: biggestSquare, status: false)
        // change value biggest square
        switch tapGesture.name {
            case "firstSquare":
                changeSizeSquare(view: firstSquare, status: true)
                biggestSquare = firstSquare
                biggestSquare.isUserInteractionEnabled = false
            case "secondSquare":
                changeSizeSquare(view: secondSquare, status: true)
                biggestSquare = secondSquare
                biggestSquare.isUserInteractionEnabled = false
            case "thirdSquare":
                changeSizeSquare(view: thirdSquare, status: true)
                biggestSquare = thirdSquare
                biggestSquare.isUserInteractionEnabled = false
            case "fourthSquare":
                changeSizeSquare(view: fourthSquare, status: true)
                biggestSquare = fourthSquare
                biggestSquare.isUserInteractionEnabled = false
            case .none, .some(_):
                return
            }
    }

    // if true -> bigger -- false -> smaller
    private func changeSizeSquare(view: UIView, status: Bool) {
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
