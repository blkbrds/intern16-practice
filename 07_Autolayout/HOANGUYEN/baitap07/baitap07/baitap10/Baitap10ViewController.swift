//
//  Baitap10ViewController.swift
//  baitap07
//
//  Created by NXH on 7/8/20.
//  Copyright © 2020 NXH. All rights reserved.
//

import UIKit

final class Baitap10ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet private weak var greenWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var redWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var purpleWidthConstraint: NSLayoutConstraint!
    // MARK: - Properties
    private var previousButton: UIButton = UIButton()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        previousButton = greenButton
    }
    
    // MARK: - IBAction
    @IBAction func allButtonTouchUpInSide(_ sender: UIButton) {
        if sender === greenButton {
            greenWidthConstraint.constant = 200
            redWidthConstraint.constant = 100
            purpleWidthConstraint.constant = 100
            yellowWidthConstraint.constant = 100
        }
        if sender == redButton {
            greenWidthConstraint.constant = 100
            redWidthConstraint.constant = 200
            purpleWidthConstraint.constant = 100
            yellowWidthConstraint.constant = 100
        }
        if sender == purpleButton {
            greenWidthConstraint.constant = 100
            redWidthConstraint.constant = 100
            purpleWidthConstraint.constant = 200
            yellowWidthConstraint.constant = 100
        }
        if sender == yellowButton {
            greenWidthConstraint.constant = 100
            redWidthConstraint.constant = 100
            purpleWidthConstraint.constant = 100
            yellowWidthConstraint.constant = 200
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}
