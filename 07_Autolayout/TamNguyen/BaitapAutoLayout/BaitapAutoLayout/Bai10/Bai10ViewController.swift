//
//  Bai10ViewController.swift
//  BaitapAutoLayout
//
//  Created by PCI0001 on 7/16/20.
//  Copyright © 2020 PCI0001. All rights reserved.
//

import UIKit

final class Bai10ViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet private weak var grayView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var heightRedLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightBlueLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightGreenLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var heightGrayLayoutConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        let grayTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGrayView))
        let greenTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGreenView))
        let blueTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapBlueView))
        let redTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapRedView))
        grayView.addGestureRecognizer(grayTapGesture)
        greenView.addGestureRecognizer(greenTapGesture)
        blueView.addGestureRecognizer(blueTapGesture)
        redView.addGestureRecognizer(redTapGesture)
    }
    
    @objc private func handleTapGrayView() {
        heightGreenLayoutConstraint.constant = 200
        heightGrayLayoutConstraint.constant = 100
        heightBlueLayoutConstraint.constant = 200
        heightRedLayoutConstraint.constant = 200
        UIView.animate(withDuration: 1.5, animations: self.setNeedsFocusUpdate)
    }
    
    @objc private func handleTapGreenView() {
        heightGreenLayoutConstraint.constant = 200
        heightGrayLayoutConstraint.constant = 100
        heightBlueLayoutConstraint.constant = 100
        heightRedLayoutConstraint.constant = 100
        UIView.animate(withDuration: 1.5, animations: self.setNeedsFocusUpdate)
    }
    
    @objc private func handleTapBlueView() {
        heightGreenLayoutConstraint.constant = 100
        heightGrayLayoutConstraint.constant = 100
        heightBlueLayoutConstraint.constant = 200
        heightRedLayoutConstraint.constant = 100
        UIView.animate(withDuration: 1.5, animations: self.setNeedsFocusUpdate)
    }
    
    @objc private func handleTapRedView() {
        heightGreenLayoutConstraint.constant = 100
        heightGrayLayoutConstraint.constant = 100
        heightBlueLayoutConstraint.constant = 100
        heightRedLayoutConstraint.constant = 200
        UIView.animate(withDuration: 1.5, animations: self.setNeedsFocusUpdate)
    }
}
