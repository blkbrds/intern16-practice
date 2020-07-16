//
//  bai10-ViewController.swift
//  Autolayout-Bai6
//
//  Created by Abcd on 7/14/20.
//  Copyright © 2020 Trungld. All rights reserved.
//

import UIKit

class bai10ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var firstUIView: UIView!
    @IBOutlet weak var secondUIView: UIView!
    @IBOutlet weak var thirdUIView: UIView!
    @IBOutlet weak var fourthUIView: UIView!
    @IBOutlet weak var heightConstraintTwo: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintOne: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintThree: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintFour: NSLayoutConstraint!
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAction()
    }
    func setUpAction() {
        firstUIView.isUserInteractionEnabled = true
        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(handleTapViewOne))
        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(handleTapViewTwo))
        let tapGestureThree = UITapGestureRecognizer(target: self, action: #selector(handleTapViewThree))
        let tapGestureFour = UITapGestureRecognizer(target: self, action: #selector(handleTapViewFour))
        firstUIView.addGestureRecognizer(tapGestureOne)
        secondUIView.addGestureRecognizer(tapGestureTwo)
        thirdUIView.addGestureRecognizer(tapGestureThree)
        fourthUIView.addGestureRecognizer(tapGestureFour)
    }
    
    @objc func handleTapViewOne(_ sender: UITapGestureRecognizer) {
        self.heightConstraintOne.constant = 128
        self.heightConstraintTwo.constant = 64
        self.heightConstraintThree.constant = 64
        self.heightConstraintFour.constant = 64
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapViewTwo(_ sender: UITapGestureRecognizer) {
        self.heightConstraintOne.constant = 64
        self.heightConstraintTwo.constant = 128
        self.heightConstraintThree.constant = 64
        self.heightConstraintFour.constant = 64
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapViewThree(_ sender: UITapGestureRecognizer) {
        self.heightConstraintOne.constant = 64
        self.heightConstraintTwo.constant = 64
        self.heightConstraintThree.constant = 128
        self.heightConstraintFour.constant = 64
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    @objc func handleTapViewFour(_ sender: UITapGestureRecognizer) {
        self.heightConstraintOne.constant = 64
        self.heightConstraintTwo.constant = 64
        self.heightConstraintThree.constant = 64
        self.heightConstraintFour.constant = 128
        UIView.animate(withDuration: 2) {
            self.setNeedsFocusUpdate()
        }
    }
    
}
