//
//  BaiTap10ViewController.swift
//  BaiTapAutoLayout
//
//  Created by NganHa on 7/16/20.
//  Copyright © 2020 Galaxy. All rights reserved.
//

import UIKit

class BaiTap10ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var grayView: UIView!
    
    @IBOutlet weak var heightGreenLayoutConstrain: NSLayoutConstraint!
    @IBOutlet weak var heightRedLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var heightGrayLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOrangeLayoutConstraint: NSLayoutConstraint!
    // MARK: - Propeties
    private var previousView = UIView()
    // MARK: - Life cycle
    override func viewDidLoad() {
          super.viewDidLoad()
        changeStateView()
      }
    // MARK: - Override functions
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
    @objc func tapInRedView() {
        if heightRedLayoutConstraint.constant == 100 {
            heightRedLayoutConstraint.constant = 200
            heightGreenLayoutConstrain.constant = 100
            heightGrayLayoutConstraint.constant = 100
            heightOrangeLayoutConstraint.constant = 100
        }
    }
    
    @objc func tapInGreenView() {
           if heightGreenLayoutConstrain.constant == 100 {
               heightGreenLayoutConstrain.constant = 200
               heightRedLayoutConstraint.constant = 100
               heightGrayLayoutConstraint.constant = 100
               heightOrangeLayoutConstraint.constant = 100
           }
       }
    
    @objc func tapInOrangeView() {
           if heightOrangeLayoutConstraint.constant == 100 {
               heightOrangeLayoutConstraint.constant = 200
               heightGreenLayoutConstrain.constant = 100
               heightGrayLayoutConstraint.constant = 100
               heightRedLayoutConstraint.constant = 100
           }
       }
    
    @objc func tapInGrayView() {
           if heightGrayLayoutConstraint.constant == 100 {
               heightGrayLayoutConstraint.constant = 200
               heightGreenLayoutConstrain.constant = 100
               heightRedLayoutConstraint.constant = 100
               heightOrangeLayoutConstraint.constant = 100
           }
       }
    
    
    // MARK: - Public functions
    // MARK: - IBActions
    

  
}
