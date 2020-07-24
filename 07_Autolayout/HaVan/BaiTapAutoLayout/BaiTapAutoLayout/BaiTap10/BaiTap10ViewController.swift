//
//  BaiTap10ViewController.swift
//  BaiTapAutoLayout
//
//  Created by NganHa on 7/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

final class BaiTap10ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var grayView: UIView!
    @IBOutlet private weak var greenViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var grayViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var orangeViewHeightLayoutConstraint: NSLayoutConstraint!
    
    // MARK: - Propeties
    private var previousView = UIView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStateView()
    }
    
    // MARK: - Private functions
    private func changeStateView() {
        redView.isUserInteractionEnabled = true
        greenView.isUserInteractionEnabled = true
        orangeView.isUserInteractionEnabled = true
        grayView.isUserInteractionEnabled = true
        let tapRed = UITapGestureRecognizer(target: self, action: #selector(tapInRedView))
        redView.addGestureRecognizer(tapRed)
        let tapGreen = UITapGestureRecognizer(target: self, action: #selector(tapInGreenView))
        greenView.addGestureRecognizer(tapGreen)
        let tapOrange = UITapGestureRecognizer(target: self, action: #selector(tapInOrangeView))
        orangeView.addGestureRecognizer(tapOrange)
        let tapGray = UITapGestureRecognizer(target: self, action: #selector(tapInGrayView))
        grayView.addGestureRecognizer(tapGray)
    }
    
    // MARK: - Objc functions
    @objc private func tapInRedView() {
        if redViewHeightLayoutConstraint.constant == 100 {
            redViewHeightLayoutConstraint.constant = 200
            greenViewHeightLayoutConstraint.constant = 100
            grayViewHeightLayoutConstraint.constant = 100
            orangeViewHeightLayoutConstraint.constant = 100
        }
    }
    
    @objc private func tapInGreenView() {
        if greenViewHeightLayoutConstraint.constant == 100 {
            greenViewHeightLayoutConstraint.constant = 200
            redViewHeightLayoutConstraint.constant = 100
            grayViewHeightLayoutConstraint.constant = 100
            orangeViewHeightLayoutConstraint.constant = 100
        }
    }
    
    @objc private func tapInOrangeView() {
        if orangeViewHeightLayoutConstraint.constant == 100 {
            orangeViewHeightLayoutConstraint.constant = 200
            greenViewHeightLayoutConstraint.constant = 100
            grayViewHeightLayoutConstraint.constant = 100
            redViewHeightLayoutConstraint.constant = 100
        }
    }
    
    @objc private func tapInGrayView() {
        if grayViewHeightLayoutConstraint.constant == 100 {
            grayViewHeightLayoutConstraint.constant = 200
            greenViewHeightLayoutConstraint.constant = 100
            redViewHeightLayoutConstraint.constant = 100
            orangeViewHeightLayoutConstraint.constant = 100
        }
    }
}
